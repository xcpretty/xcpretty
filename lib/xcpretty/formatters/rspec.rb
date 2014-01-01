module XCPretty

  class RSpec < Formatter

    FAIL = "F"
    PASS = "."
    PENDING = "P"

    def optional_newline
      ''
    end

    def format_passing_test(suite, test_case, time)
      green(PASS)
    end

    def format_failing_test(test_suite, test_case, reason, file)
      red(FAIL)
    end

    def format_pending_test(suite, test_case)
      yellow(PENDING)
    end

  end

end
