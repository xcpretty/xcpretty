module XCPretty

  class RSpec < Formatter

    FAIL = "F"
    PASS = "."

    def optional_newline
      ''
    end

    def format_passing_test(suite, test_case, time)
      green(PASS)
    end

    def format_failing_test(test_suite, test_case, reason, file)
      red(FAIL)
    end

  end

end
