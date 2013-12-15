require "xcpretty/ansi"

module XCPretty

  class Printer

    attr_reader :formatter

    def initialize(params)
      klass = params[:formatter]
      @formatter = klass.new(params[:unicode], params[:colorize])
    end

    def pretty_print(text)
      formatted_text = formatter.pretty_format(text)
      STDOUT.print(formatted_text + formatter.optional_newline) unless formatted_text.empty?
    end

  end
end
