require "xcpretty/ansi"

module XCPretty

  module Matchers
    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_START_MATCHER = /Test Suite '(?:.*\/)?(.*[ox]ctest.*)' started at(.*)/

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_COMPLETION_MATCHER = /Test Suite '(?:.*\/)?(.*[ox]ctest.*)' finished at(.*)/

    # @regex Captured groups
    # $1 = test_case
    # $2 = time
    PASSING_TEST_MATCHER = /Test Case\s'-\[.*\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/

    # @regex Captured groups
    # $1 = file
    # $2 = test_suite
    # $3 = test_case
    # $4 = reason
    FAILING_TEST_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\s(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

    # @regex Captured groups
    # $1 test suite name
    TEST_SUITE_START_MATCHER = /Test Suite '(.*)' started at/
    EXECUTED_MATCHER = /^Executed/
  end

  class Printer

    include Matchers

    attr_reader :formatter

    def initialize(params)
      klass = params[:formatter]
      @formatter = klass.new(params[:unicode], params[:colorize])
    end

    def pretty_print(text)
      update_test_state(text)
      formatted_text = formatter.pretty_format(text)
      formatted_text = format_test_summary(text) if formatted_text.empty?

      STDOUT.print(formatted_text + formatter.optional_newline) unless formatted_text.empty?
    end

    def update_test_state(text)
      case text
      when TESTS_RUN_START_MATCHER
        @tests_done = false
        @printed_summary = false
        @failures = {}
      when TESTS_RUN_COMPLETION_MATCHER
        @tests_done = true
      when FAILING_TEST_MATCHER
        store_failure($1, $2, $3, $4)
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

    def test_summary(executed_message)
      failures = formatter.format_failures(failures_per_suite)
      final_message = if colorize?
                        failures.any? ? red(executed_message) : green(executed_message)
                      else
                        executed_message
                      end
      text = [failures, final_message].join("\n\n\n").strip
      "\n\n#{text}"
    end

    def formatted_summary(executed_message)

    end

    def failures_per_suite
      @failures ||= {}
    end

    def store_failure(file, test_suite, test_case, reason)
      failures_per_suite[test_suite] ||= []
      failures_per_suite[test_suite] << {
        :file => cyan(file),
        :reason => red(reason),
        :test_case => test_case,
      }
    end
  end
end
