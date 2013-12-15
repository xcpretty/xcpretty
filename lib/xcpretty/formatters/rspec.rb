module XCPretty

  class RSpec < Formatter

    FAIL = "F"
    PASS = "."

    def optional_newline
      ''
    end

    def format_passing_test(test_case, time)
      green(PASS)
    end

    def format_failing_test(file, test_suite, test_case, reason)
      red(FAIL)
    end

  end

end
