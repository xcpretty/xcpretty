#!/usr/bin/env ruby
require 'pathname'

class Chunk
  def initialize(name, &block)
    @name = name
    @line_handlers = []
    @exit = /^\n/
    block.call(self)
  end

  def line(regex, &block)
    @line_handlers << [regex, (block if block_given?)]
  end

  def exit(regex)
    @exit = regex
  end

  # Used for faster iteration and finding the responsible chunk.
  # Goes only over entry points insted of trying every regex for a chunk.
  # Parses and registers itself as responsible chunk when done.
  def enter(line, formatter)
    entry_regex, handler = @line_handlers.first
    if match = line.match(entry_regex)
      handler.call(formatter, match)
      return self
    end
  end

  # Handles a given line from the parser, and tries to recognize it.  If the
  # line was recognized, it will either be printed (block given) or ignored (no
  # block given).  If the line was not recognized, it will be printed as it is.
  def handle(line, formatter)
    @line_handlers.each do |handler|
      matches = line.match(handler.first)
      if matches
        handler[1].call(formatter, matches) if handler[1]
        return self
      end
    end
    return nil if line.match(@exit)

    formatter.format_unknown(line.strip)
    return self
  end
end

class Parser
  @@chunks = []
  attr_reader :formatter

  def initialize(formatter)
    @formatter = formatter
    @chunks = []
  end

  # Parses a line of a log file.
  #
  # It asks the current chunk to process line, or if there's no chunk, it finds
  # the responsible one. If no responsible chunk is found, it'll just print out
  # the line and move on.
  #
  # If there was a responsible chunk, it'll try to recognize the line and
  # format it. If the line wasn't recognized by a chunk it'll just print it
  # out and keep waiting for it's own input.
  #
  # When a chunk sees it's end (empty newline by default), it de-registers
  # itself and parser tries to find a new one for the next line.
  def parse(line)
    if @current_chunk
      @current_chunk = @current_chunk.handle(line, @formatter)
    else
      @@chunks.each do |chunk|
        @current_chunk = chunk.enter(line, @formatter)
        return if @current_chunk
      end
      # Nobody recognizes this
      formatter.format_unknown(line.strip)
    end
  end

  def self.add(name, &block)
    @@chunks << Chunk.new(name, &block)
  end
end

def chunk(name, &block)
  Parser.add(name, &block)
end


PATH              = /[ \w\/:\\\-+.]+\/?/
SOURCE_EXTENSIONS = /m|mm|c|cc|cpp|cxx|swift/
SHELL_CD          = /^\s{4}cd\s(#{PATH})$/
SHELL_SETENV      = /^\s{4}setenv(?:#{PATH})?[\w\-]+\s(.*)$/
SHELL_EXPORT      = /^\s{4}export \w+=.*$/
SHELL_MKDIR       = /^\/bin\/mkdir -p/
SHELL_BUILTIN     = /^\s{4}builtin-/

chunk "Compiling" do |c|
  c.line /^CompileC (?:#{PATH}\.o) (#{PATH}\.(?:#{SOURCE_EXTENSIONS})) .*$/ do |f, m|
    f.format_compile(Pathname.new(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_SETENV
  c.line SHELL_EXPORT
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/clang .*$/
end

chunk "Compiling Swift" do |c|
  c.line /^CompileSwift (?:[\w]+\s)*(#{PATH}\.swift)$/ do |f, m|
    f.format_compile(Pathname.new(m[1]))
  end
  c.line SHELL_CD
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swift .*$/
end

chunk "Compile a pile of swift files" do |c|
  c.line /^CompileSwiftSources/ do |f|
    f.format_compile_swift_sources
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swiftc .*$/
end

chunk "Merging swift modules" do |c|
  c.line /^MergeSwiftModule (?:[\w]+\s)*(#{PATH}\.swiftmodule)$/ do |f, m|
    f.format_merge_swift_module(Pathname.new(m[1]))
  end
  c.line SHELL_CD
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swift .*$/
end

chunk "Code sign" do |c|
  c.line /^CodeSign\s(#{PATH})$/ do |f, m|
    f.format_codesign(Pathname.new(m[1]))
  end
  c.line SHELL_CD
end

chunk "Write auxilliary files" do |c|
  c.line /^Write auxiliary files$/ do |f|
    f.format_write_auxiliary_files()
  end
  c.line SHELL_MKDIR
  c.line /^write-file (#{PATH})$/ do |f,m|
    f.format_write_file(Pathname.new(m[1]))
  end
end

chunk "Create product structure" do |c|
  c.line /^Create product structure$/ do |f|
    f.format_create_product_structure()
  end
  c.line SHELL_MKDIR
end

chunk "Process info.plist" do |c|
  c.line /^ProcessInfoPlistFile (?:#{PATH}.plist) (#{PATH}.plist)$/ do |f,m|
    f.format_process_info_plist(Pathname.new(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_BUILTIN
end

class Formatter
  def format_compile(path); end
  def format_unknown(line); end
  def format_compile_swift_sources(); end
  def format_merge_swift_module(); end
  def format_write_auxiliary_files(); end
  def format_write_file(path); end
  def format_create_product_structure; end
  def format_process_info_plist(path); end
end

class DummyFormatter < Formatter
  def format_compile(path)
    puts "Compile #{path.basename}"
  end
  def format_unknown(line)
    puts "WAT: #{line}"
  end
  def format_compile_swift_sources()
    puts "Compile a bunch of swift"
  end
  def format_merge_swift_module(path)
    puts "Merge Swift module #{path.basename}"
  end
  def format_write_auxiliary_files()
    puts "Write auxiliary files"
  end
  def format_write_file(path)
    puts "Write file #{path.basename}"
  end
  def format_create_product_structure
    puts "Create product structure"
  end
  def format_process_info_plist(path)
    puts "Process #{path.basename}"
  end
end

if $PROGRAM_NAME == __FILE__
  parser = Parser.new(DummyFormatter.new)
  STDIN.each_line do |line|
    parser.parse(line)
  end
end
