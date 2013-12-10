module XCPretty
  module Printer

    class RSpec

      include Printer

      FAIL = "F"
      PASS = "."

      def pretty_format(text)
        case text
        when PASSING_TEST_MATCHER
          green(PASS)
        when FAILING_TEST_MATCHER
          red(FAIL)
        else
          ""
        end
      end
    end
  end
end
