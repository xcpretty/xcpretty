module JSON
  MAP = {
    "\x0" => '\u0000',
    "\x1" => '\u0001',
    "\x2" => '\u0002',
    "\x3" => '\u0003',
    "\x4" => '\u0004',
    "\x5" => '\u0005',
    "\x6" => '\u0006',
    "\x7" => '\u0007',
    "\b"  =>  '\b',
    "\t"  =>  '\t',
    "\n"  =>  '\n',
    "\xb" => '\u000b',
    "\f"  =>  '\f',
    "\r"  =>  '\r',
    "\xe" => '\u000e',
    "\xf" => '\u000f',
    "\x10" => '\u0010',
    "\x11" => '\u0011',
    "\x12" => '\u0012',
    "\x13" => '\u0013',
    "\x14" => '\u0014',
    "\x15" => '\u0015',
    "\x16" => '\u0016',
    "\x17" => '\u0017',
    "\x18" => '\u0018',
    "\x19" => '\u0019',
    "\x1a" => '\u001a',
    "\x1b" => '\u001b',
    "\x1c" => '\u001c',
    "\x1d" => '\u001d',
    "\x1e" => '\u001e',
    "\x1f" => '\u001f',
    '"'   =>  '\"',
    '\\'  =>  '\\\\',
  } # :nodoc:

  if defined?(::Encoding)
    def utf8_to_json(string) # :nodoc:
      string = string.dup
      string.force_encoding(::Encoding::ASCII_8BIT)
      string.gsub!(/["\\\x0-\x1f]/) { MAP[$&] }
      string.force_encoding(::Encoding::UTF_8)
      string
    end

    def utf8_to_json_ascii(string) # :nodoc:
      string = string.dup
      string.force_encoding(::Encoding::ASCII_8BIT)
      string.gsub!(/["\\\x0-\x1f]/n) { MAP[$&] }
      string.gsub!(/(
                      (?:
                        [\xc2-\xdf][\x80-\xbf]    |
                        [\xe0-\xef][\x80-\xbf]{2} |
                        [\xf0-\xf4][\x80-\xbf]{3}
                      )+ |
                      [\x80-\xc1\xf5-\xff]       # invalid
                    )/nx) { |c|
                      c.size == 1 and raise GeneratorError, "invalid utf8 byte: '#{c}'"
                      s = JSON.iconv('utf-16be', 'utf-8', c).unpack('H*')[0]
                      s.force_encoding(::Encoding::ASCII_8BIT)
                      s.gsub!(/.{4}/n, '\\\\u\&')
                      s.force_encoding(::Encoding::UTF_8)
                    }
      string.force_encoding(::Encoding::UTF_8)
      string
    rescue => e
      raise GeneratorError.wrap(e)
    end

    def valid_utf8?(string)
      encoding = string.encoding
      (encoding == Encoding::UTF_8 || encoding == Encoding::ASCII) &&
        string.valid_encoding?
    end
    module_function :valid_utf8?
  else
    def utf8_to_json(string) # :nodoc:
      string.gsub(/["\\\x0-\x1f]/n) { MAP[$&] }
    end

    def utf8_to_json_ascii(string) # :nodoc:
      string = string.gsub(/["\\\x0-\x1f]/) { MAP[$&] }
      string.gsub!(/(
                      (?:
                        [\xc2-\xdf][\x80-\xbf]    |
                        [\xe0-\xef][\x80-\xbf]{2} |
                        [\xf0-\xf4][\x80-\xbf]{3}
                      )+ |
                      [\x80-\xc1\xf5-\xff]       # invalid
                    )/nx) { |c|
        c.size == 1 and raise GeneratorError, "invalid utf8 byte: '#{c}'"
        s = JSON.iconv('utf-16be', 'utf-8', c).unpack('H*')[0]
        s.gsub!(/.{4}/n, '\\\\u\&')
      }
      string
    rescue => e
      raise GeneratorError.wrap(e)
    end

    def valid_utf8?(string)
      string =~
         /\A( [\x09\x0a\x0d\x20-\x7e]         # ASCII
         | [\xc2-\xdf][\x80-\xbf]             # non-overlong 2-byte
         |  \xe0[\xa0-\xbf][\x80-\xbf]        # excluding overlongs
         | [\xe1-\xec\xee\xef][\x80-\xbf]{2}  # straight 3-byte
         |  \xed[\x80-\x9f][\x80-\xbf]        # excluding surrogates
         |  \xf0[\x90-\xbf][\x80-\xbf]{2}     # planes 1-3
         | [\xf1-\xf3][\x80-\xbf]{3}          # planes 4-15
         |  \xf4[\x80-\x8f][\x80-\xbf]{2}     # plane 16
        )*\z/nx
    end
  end
  module_function :utf8_to_json, :utf8_to_json_ascii, :valid_utf8?


  module Pure
    module Generator
      class State

        def self.from_state(opts)
          case
          when self === opts
            opts
          when opts.respond_to?(:to_hash)
            new(opts.to_hash)
          when opts.respond_to?(:to_h)
            new(opts.to_h)
          else
            new
          end
        end

        def initialize(opts = {})
          @indent                = ''
          @space                 = ''
          @space_before          = ''
          @object_nl             = ''
          @array_nl              = ''
          @allow_nan             = false
          @ascii_only            = false
          @quirks_mode           = false
          @buffer_initial_length = 1024

          configure opts
        end

        attr_accessor :indent, :space, :space_before, :object_nl, :array_nl,
                      :max_nesting, :quirks_mode, :buffer_initial_length, :depth

        def buffer_initial_length=(length)
          if length > 0
            @buffer_initial_length = length
          end
        end

        def check_max_nesting # :nodoc:
          return if @max_nesting.zero?
          current_nesting = depth + 1
          current_nesting > @max_nesting and
            raise NestingError, "nesting of #{current_nesting} is too deep"
        end

        def check_circular?
          !@max_nesting.zero?
        end

        def allow_nan?
          @allow_nan
        end

        def ascii_only?
          @ascii_only
        end

        def quirks_mode?
          @quirks_mode
        end

        def configure(opts)
          if opts.respond_to?(:to_hash)
            opts = opts.to_hash
          elsif opts.respond_to?(:to_h)
            opts = opts.to_h
          else
            raise TypeError, "can't convert #{opts.class} into Hash"
          end
          for key, value in opts
            instance_variable_set "@#{key}", value
          end
          @indent                = opts[:indent] if opts.key?(:indent)
          @space                 = opts[:space] if opts.key?(:space)
          @space_before          = opts[:space_before] if opts.key?(:space_before)
          @object_nl             = opts[:object_nl] if opts.key?(:object_nl)
          @array_nl              = opts[:array_nl] if opts.key?(:array_nl)
          @allow_nan             = !!opts[:allow_nan] if opts.key?(:allow_nan)
          @ascii_only            = opts[:ascii_only] if opts.key?(:ascii_only)
          @depth                 = opts[:depth] || 0
          @quirks_mode           = opts[:quirks_mode] if opts.key?(:quirks_mode)
          @buffer_initial_length ||= opts[:buffer_initial_length]

          if !opts.key?(:max_nesting) # defaults to 100
            @max_nesting = 100
          elsif opts[:max_nesting]
            @max_nesting = opts[:max_nesting]
          else
            @max_nesting = 0
          end
          self
        end
        alias merge configure

        def to_h
          result = {}
          for iv in instance_variables
            iv = iv.to_s[1..-1]
            result[iv.to_sym] = self[iv]
          end
          result
        end

        alias to_hash to_h

        def generate(obj)
          result = obj.to_json(self)
          JSON.valid_utf8?(result) or raise GeneratorError,
            "source sequence #{result.inspect} is illegal/malformed utf-8"
          unless @quirks_mode
            unless result =~ /\A\s*\[/ && result =~ /\]\s*\Z/ ||
              result =~ /\A\s*\{/ && result =~ /\}\s*\Z/
            then
              raise GeneratorError, "only generation of JSON objects or arrays allowed"
            end
          end
          result
        end

        def [](name)
          if respond_to?(name)
            __send__(name)
          else
            instance_variable_get("@#{name}")
          end
        end

        def []=(name, value)
          if respond_to?(name_writer = "#{name}=")
            __send__ name_writer, value
          else
            instance_variable_set "@#{name}", value
          end
        end
      end

      module GeneratorMethods
        module Object
          def to_json(*) to_s.to_json end
        end

        module Hash
          def to_json(state = nil, *)
            state = State.from_state(state)
            state.check_max_nesting
            json_transform(state)
          end

          private

          def json_shift(state)
            state.object_nl.empty? or return ''
            state.indent * state.depth
          end

          def json_transform(state)
            delim = ','
            delim << state.object_nl
            result = '{'
            result << state.object_nl
            depth = state.depth += 1
            first = true
            indent = !state.object_nl.empty?
            each { |key,value|
              result << delim unless first
              result << state.indent * depth if indent
              result << key.to_s.to_json(state)
              result << state.space_before
              result << ':'
              result << state.space
              result << value.to_json(state)
              first = false
            }
            depth = state.depth -= 1
            result << state.object_nl
            result << state.indent * depth if indent
            result << '}'
            result
          end
        end

        module Array
          def to_json(state = nil, *)
            state = State.from_state(state)
            state.check_max_nesting
            json_transform(state)
          end

          private

          def json_transform(state)
            delim = ','
            delim << state.array_nl
            result = '['
            result << state.array_nl
            depth = state.depth += 1
            first = true
            indent = !state.array_nl.empty?
            each { |value|
              result << delim unless first
              result << state.indent * depth if indent
              result << value.to_json(state)
              first = false
            }
            depth = state.depth -= 1
            result << state.array_nl
            result << state.indent * depth if indent
            result << ']'
          end
        end

        module Integer
          def to_json(*) to_s end
        end

        module Float
          def to_json(state = nil, *)
            state = State.from_state(state)
            case
            when infinite?
              if state.allow_nan?
                to_s
              else
                raise GeneratorError, "#{self} not allowed in JSON"
              end
            when nan?
              if state.allow_nan?
                to_s
              else
                raise GeneratorError, "#{self} not allowed in JSON"
              end
            else
              to_s
            end
          end
        end

        module String
          if defined?(::Encoding)
            def to_json(state = nil, *args)
              state = State.from_state(state)
              if encoding == ::Encoding::UTF_8
                string = self
              else
                string = encode(::Encoding::UTF_8)
              end
              if state.ascii_only?
                '"' << JSON.utf8_to_json_ascii(string) << '"'
              else
                '"' << JSON.utf8_to_json(string) << '"'
              end
            end
          else
            def to_json(state = nil, *args)
              state = State.from_state(state)
              if state.ascii_only?
                '"' << JSON.utf8_to_json_ascii(self) << '"'
              else
                '"' << JSON.utf8_to_json(self) << '"'
              end
            end
          end

          module Extend
            def json_create(o)
              o['raw'].pack('C*')
            end
          end

          def self.included(modul)
            modul.extend Extend
          end

          def to_json_raw_object
            {
              JSON.create_id  => self.class.name,
              'raw'           => self.unpack('C*'),
            }
          end

          def to_json_raw(*args)
            to_json_raw_object.to_json(*args)
          end
        end

        module TrueClass
          def to_json(*) 'true' end
        end

        module FalseClass
          def to_json(*) 'false' end
        end

        module NilClass
          def to_json(*) 'null' end
        end
      end
    end
  end
end

class NilClass
  include JSON::Pure::Generator::GeneratorMethods::NilClass
end

class Hash
  include JSON::Pure::Generator::GeneratorMethods::Hash
end

class Array
  include JSON::Pure::Generator::GeneratorMethods::Array
end

class String
  include JSON::Pure::Generator::GeneratorMethods::String
end

class Integer
  include JSON::Pure::Generator::GeneratorMethods::Integer
end

class Float
  include JSON::Pure::Generator::GeneratorMethods::Float
end