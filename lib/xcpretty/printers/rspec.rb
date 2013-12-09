module XCPretty
  module Printer

    class RSpec
      
      include Printer

      FAIL = "F"
      PASS = "."

      def pretty_format(text)
        case text
        when PASSING_TEST_MATCHER
          colorize? ? green(PASS) : PASS
        when FAILING_TEST_MATCHER
          colorize? ? red(FAIL) : FAIL
        else
          ""
        end
      end

    end
  end
end
