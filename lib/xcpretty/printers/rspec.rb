module XCPretty
  module Printer

    class RSpec
      include Printer

      FAIL = "F"
      PASS = "."

      def pretty_format(text)
        format case text
        when /\[PASSED\]$/
          PASS
        when /Test Suite 'All tests' finished at/
          @tests_done = true
          ""
        when /^Executed/
          @tests_done ? test_summary(text) : ""
        when FAILURE_MATCHER
          FAIL
        else
          ""
        end
      end

      private

      def format(output)
        if colorize?
          return case output
          when FAIL then red(output)
          when PASS then green(output)
          else
            output
          end
        end
        output
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
    end
  end
end