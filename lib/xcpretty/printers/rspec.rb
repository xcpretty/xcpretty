module XCPretty
  module Printer
  
    class RSpec

      def pretty_print(text)
        case text
        when /\[PASSED\]$/
          "."
        when /\[FAILED\]/
          "F"
        when /Test Suite 'All tests' finished at/
          @tests_done = true
          ""
        when /^Executed/
          @tests_done ? "\n\n#{text}" : ""
        else
          ""
        end
      end

    end

  end
end
