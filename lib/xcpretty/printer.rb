require "paint"

module XCPretty

	module Printer

		attr_accessor :colorize

		FAILING_TEST_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/
    TESTS_DONE_MATCHER = /Test Suite ('.*\.octest(.*)') finished at/
    PASSING_TEST_MATCHER = /Test Case\s'-\[(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/
    EXECUTED_MATCHER = /^Executed/

		Paint::SHORTCUTS[:printer] = {
		  :white => Paint.color(:bold),
      :red   => Paint.color(:red),
      :green => Paint.color(:green, :bright),
      :link  => Paint.color(:cyan),
    }

		include Paint::Printer

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
      if text =~ EXECUTED_MATCHER && @tests_done
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
        path   = colorize? ? link(f[:file]) : f[:file]
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
        file: file,
        test_case: test_case,
        failure_message: failure_message
      }
    end

    def colorize?
    	!!@colorize
    end
	end
end
