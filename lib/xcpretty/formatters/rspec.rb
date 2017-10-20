module XCPretty

  class RSpec < Formatter

    FAIL = "F"
    PASS = "."
    PENDING = "P"
    MEASURING = 'T'

    def optional_newline
      ''
    end

    def format_passing_device_test(suite, test_case, time, device)
      green(PASS)
    end

    def format_failing_device_test(test_suite, test_case, reason, file, device)
      red(FAIL)
    end

    def format_pending_device_test(suite, test_case, device)
      yellow(PENDING)
    end

    def format_measuring_test(suite, test_case, time)
      yellow(MEASURING)
    end

  end

end

