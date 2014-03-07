module XCPretty

  class Knock < Formatter

    FAIL = "not ok"
    PASS = "ok"

    def format_passing_test(suite, test_case, time)
      green(PASS) + " - #{test_case}"
    end

    def format_failing_test(test_suite, test_case, reason, file)
      red(FAIL) + " - #{test_case}: FAILED" +
        format_diagnostics(reason) +
        format_diagnostics("  #{file}: #{test_suite} - #{test_case}")
    end

    def format_test_summary(executed_message, failures_per_suite)
      ''
    end

    private

    def format_diagnostics(text)
      "\n# #{text}"
    end

  end

end