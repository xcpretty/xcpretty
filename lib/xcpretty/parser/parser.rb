require 'pathname'
module XCPretty

def self.chunk(name, &block)
  Parser.add(name, &block)
end

def self.path(string)
  Pathname.new(string.delete('\\'))
end

module Log
  def self.debug(*args)
    if ENV["XCPRETTY_DEBUG"]
      puts "DEBUG [#{args.shift}]: #{args.join}"
    end
  end

  def self.info(*args)
    puts args unless ENV["_"].end_with?("rspec")
  end
end

# Chunk represents a segment of xcodebuild's output, usually # grouped by the
# task (e.g. Compile, Analyze, ...).
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
      Log.debug(@name, "Entered #{line}")
      handler.call(formatter, match) if handler
      return self
    end
  end

  # Handles a given line from the parser, and tries to recognize it.  If the
  # line was recognized, it will either be printed (block given) or ignored (no
  # block given).  If the line was not recognized, it will be printed as it is.
  def handle(line, formatter)
    @line_handlers.each do |handler|
      matches = line.match(handler.first)
      next unless matches

      Log.debug(@name, "Handling #{line}")
      handler[1].call(formatter, matches) if handler[1]
      return self
    end
    if line.match(@exit)
      Log.debug(@name, "Exiting")
      return nil
    end

    Log.debug(@name, "Not recognized: ", line.chomp)
    formatter.format_unknown(line.chomp)
    return self
  end
end

class Parser
  @@chunks = []
  attr_reader :formatter

  def initialize(formatter)
    @formatter = formatter
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
      @current_chunk = @@chunks.find { |c| c.enter(line, @formatter) }

      # Nobody recognizes this. Just print out
      formatter.format_unknown(line.chomp) unless @current_chunk
    end
  end

  # Adds a chunk to parser.
  def self.add(name, &block)
    @@chunks << Chunk.new(name, &block)
  end
end

end # XCPretty
