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
    handler = []
    handler << regex
    handler << block if block_given?
    @line_handlers << handler
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

  def parse(line)
    if @current_chunk
      @current_chunk = @current_chunk.handle(line, @formatter)
      return
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


class Formatter
  def format_compile(path); end
  def format_unknown(line); end
  def format_compile_swift_sources(); end
end


PATH              = /[ \w\/:\\\-+.]+\/?/
SOURCE_EXTENSIONS = /m|mm|c|cc|cpp|cxx|swift/
SHELL_CD          = /^\s{4}cd\s(#{PATH})$/
SHELL_SETENV      = /^\s{4}setenv(?:#{PATH})?[\w\-]+\s(.*)$/

Parser.add "Compiling" do |c|
  c.line /^CompileC (?:#{PATH}\.o) (#{PATH}\.(?:#{SOURCE_EXTENSIONS})) .*$/ do |formatter, match|
    formatter.format_compile(Pathname.new(match[1]))
  end

  c.line SHELL_CD
  c.line SHELL_SETENV
  # Suppress giant clang output
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/clang .*$/
end


Parser.add "Compiling Swift" do |c|
  c.line /^CompileSwift (?:[\w]+\s)*(#{PATH}\.swift)$/ do |formatter, match|
    formatter.format_compile(Pathname.new(match[1]))
  end
  c.line SHELL_CD
  # Suppress giant swift output
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swift .*$/
end

Parser.add "Compile a pile of swift files" do |c|
  c.line /^CompileSwiftSources/ do |formatter, match|
    formatter.format_compile_swift_sources
  end

  c.line SHELL_CD

  # Suppress giant swiftc output
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swiftc .*$/
end

Parser.add "Code sign" do |c|
  c.line /^CodeSign\s(#{PATH})$/ do |f, m|
    f.format_codesign(Pathname.new(m[1]))
  end

  c.line SHELL_CD
end


class DummyFormatter < Formatter
  def format_compile(path)
    puts "Compiling #{path.basename}"
  end
  def format_unknown(line)
    puts "WAT: #{line}"
  end
  def format_compile_swift_sources()
    puts "Compiling a bunch of swift"
  end
end

if $PROGRAM_NAME == __FILE__
  parser = Parser.new(DummyFormatter.new)
  STDIN.each_line do |line|
    parser.parse(line)
  end
end
