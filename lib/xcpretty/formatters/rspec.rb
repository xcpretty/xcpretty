module XCPretty

  class RSpec < Formatter

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

    def optional_newline
      ''
    end

  end

end
