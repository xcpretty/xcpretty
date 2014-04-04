module XCPretty
  class JSONCompilationDatabase

    include XCPretty::FormatMethods
    FILEPATH = 'build/reports/compilation_db.json'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        unless Object.const_defined?(:JSON)
          begin
            require 'json'
          rescue LoadError
            require File.expand_path('vendor/json_pure/generator')
          end
        end
        @@loaded = true
      end
    end

    def initialize(options)
      load_dependencies
      @filepath           = options[:path] || FILEPATH
      @parser             = Parser.new(self)
      @compilation_units  = []
      @current_file       = nil
      @current_path       = nil
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_compile(file_name, file_path)
      @current_file = file_name
      @current_path = File.dirname(file_path)
    end

    def format_compile_command(compiler_command)
      @compilation_units << { :command => compiler_command, 
        :file => @current_file, :directory => @current_path }
    end

    def finish
      FileUtils.mkdir_p(File.dirname(@filepath))
      write_report
    end

    private

    def write_report
      File.open(@filepath, 'w') do |f|
        f.write(@compilation_units.to_json)
      end
    end
  end
end
