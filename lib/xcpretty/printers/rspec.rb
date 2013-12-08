module XCPretty
  module Printer
  
    class RSpec

      def pretty_print(text)
        case text
        when /\[PASSED\]$/
          "."
        when /Test Suite 'All tests' finished at/
          @tests_done = true
          ""
        when /^Executed/
          @tests_done ? test_summary(text) : ""
        when /(.+:\d+):\serror:\s[\+\-].*\s:\s'(.*)'\s\[FAILED\],\s(.*)/
          store_failure($1, $2, $3)
          "F"
        else
          ""
        end
      end


      private

      def test_summary(executed_message)
        failures.empty? ? "\n\n#{executed_message}" : summary_with_failures(executed_message)
      end

      def summary_with_failures(executed_message)
        formatted_failures = failures.map do |f|
          "#{f[:test_case]}, #{f[:failure_message]}\n#{f[:file]}"
        end.join("\n\n")

        "\n\n#{formatted_failures}\n\n\n#{executed_message}"
      end

      def store_failure(file, test_case, failure_message)
        failures << {
          file: file,
          test_case: test_case,
          failure_message: failure_message
        }
      end

      def failures
        @failures ||= []
      end

    end
  end
end
