module XCPretty
  module Printer
  
    class RSpec

      def pretty_print(text)
        case text
        when /\[PASSED\]$/
          "."
        when /\[FAILED\]/
          "F"
        else
          ""
        end
      end

    end

  end
end
