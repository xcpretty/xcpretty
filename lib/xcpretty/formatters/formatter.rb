require 'xcpretty/ansi'

module XCPretty

  class Formatter

    include ANSI
    include XCPretty::Matchers

    def initialize(use_unicode, colorize)
      @use_unicode = use_unicode
      @colorize = colorize
    end

    def use_unicode?
      !!@use_unicode
    end

    def optional_newline
      "\n"
    end

    def format_failures(failures)
      failures.map do |suite, failures|
        formatted_failures = failures.map do |f|
          "  #{f[:test_case]}, #{f[:reason]}\n  #{f[:file]}"
        end.join("\n\n")

        "\n#{suite}\n#{formatted_failures}"
      end.join("\n")
    end

  end

end
