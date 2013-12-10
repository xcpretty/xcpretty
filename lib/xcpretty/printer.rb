require "xcpretty/ansi"

module XCPretty

  module Printer

    attr_accessor :colorize

    # @regex Captured groups
    # $1 = file
    # $2 = test_case
    # $3 = failure_message
    FAILING_TEST_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

    # @regex Captured groups
    # $1 = test_case
    # $2 = time
    PASSING_TEST_MATCHER = /Test Case\s'-\[.*\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/

    TESTS_DONE_MATCHER = /Test Suite ('.*\.(o|x)ctest(.*)') finished at/
    # @regex Captured groups
    # $1 test suite name
    TESTS_START_MATCHER = /Test Suite ('.*(\.(o|x)ctest(.*))?') started at/
    EXECUTED_MATCHER = /^Executed/

    include ANSI

    def pretty_print(text)
      update_test_state(text)
      formatted_text = pretty_format(text)
      formatted_text = format_test_summary(text) if formatted_text.empty?

      STDOUT.print(formatted_text + optional_newline) unless formatted_text.empty?
    end

    def update_test_state(text)
      case text
      when FAILING_TEST_MATCHER
        store_failure($1, $2, $3)
      when TESTS_DONE_MATCHER
        @tests_done = true
      end
    end

    def format_test_summary(text)
      if text =~ EXECUTED_MATCHER && @tests_done && !@printed_summary
        @printed_summary = true
        test_summary(text)
      else
        ""
      end
    end

    def optional_newline
      ""
    end

    def project_build_info(text)
      target = text.split('TARGET').last.split('OF PROJECT').first
      clean_target = target.split('-').last.strip
      project = text.split('OF PROJECT').last.split('WITH').first.strip
      configuration = text.split('CONFIGURATION').last.split('===').first.strip
      {
        :target => clean_target,
        :project => project,
        :configuration => configuration
      }
    end

    def test_summary(executed_message)
      formatted_failures = failures.map do |f|
        reason = colorize? ? red(f[:failure_message]) : f[:failure_message]
        path   = colorize? ? cyan(f[:file]) : f[:file]
        "#{f[:test_case]}, #{reason}\n#{path}"
      end.join("\n\n")
      final_message = if colorize?
                        failures.any? ? red(executed_message) : green(executed_message)
                      else
                        executed_message
                      end
      text = [formatted_failures, final_message].join("\n\n\n").strip
      "\n\n#{text}"
    end

    def failures
      @failures ||= []
    end

    def store_failure(file, test_case, failure_message)
      failures << {
        :file => file,
        :test_case => test_case,
        :failure_message => failure_message
      }
    end

    def colorize?
      !!@colorize
    end
  end
end
