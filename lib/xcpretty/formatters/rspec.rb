module XCPretty

  class RSpec < Formatter

    FAIL = "F"
    PASS = "."
    PENDING = "P"
    MEASURING = 'T'

    def format_passing_test(suite, test_case, time)
      output.puts green(PASS)
    end

    def format_failing_test(test_suite, test_case, reason, file)
      output.puts red(FAIL)
    end

    def format_pending_test(suite, test_case)
      output.puts yellow(PENDING)
    end

    def format_measuring_test(suite, test_case, time)
      output.puts yellow(MEASURING)
    end

  end

end

