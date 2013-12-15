require 'xcpretty/ansi'

module XCPretty

  class Formatter

    include ANSI

    def initialize(use_unicode, colorize)
      @use_unicode = use_unicode
      @colorize = colorize
    end

    def pretty_format(text)
      tokenizer.tokenize(text)
      update_test_state(text)
      formatted_text = pretty_format(text)
    end

    def use_unicode?
      !!@use_unicode
    end

    def optional_newline
      "\n"
    end

    def format_test_summary(executed_message)
      failures = format_failures(failures_per_suite)
      final_message = if colorize?
                        failures.empty? ? green(executed_message) : red(executed_message)
                      else
                        executed_message
                      end
      text = [failures, final_message].join("\n\n\n").strip
      "\n\n#{text}"
    end

    def format_failures(failures)
      failures.map do |suite, failures|
        formatted_failures = failures.map do |f|
          "  #{f[:test_case]}, #{f[:reason]}\n  #{f[:file]}"
        end.join("\n\n")

        "\n#{suite}\n#{formatted_failures}"
      end.join("\n")
    end

    #########################################################
    # PROTECTED / OVERRIDES
    #########################################################

    def format_compiling(file)
      ""
    end

    def format_cleaning(project, target, configuration)
      ""
    end

    #########################################################


    private

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
    
    def store_failure(file, test_suite, test_case, reason)
      failures_per_suite[test_suite] ||= []
      failures_per_suite[test_suite] << {
        :file => cyan(file),
        :reason => red(reason),
        :test_case => test_case,
      }
    end

    def failures_per_suite
      @failures ||= {}
    end

    def test_summary(executed_message)
      if executed_message =~ EXECUTED_MATCHER && @tests_done && !@printed_summary
        @printed_summary = true
        format_test_summary(executed_message)
      else
        ""
      end
    end

  end

end
