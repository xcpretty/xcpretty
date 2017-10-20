module XCPretty

  class Knock < Formatter

    FAIL = 'not ok'
    PASS = 'ok'

    def format_passing_device_test(suite, test_case, time, device)
      "#{PASS} - #{format_test_description(test_case, device)}"
    end

    def format_failing_device_test(test_suite, test_case, reason, file, device)
      knock_result =
      "#{FAIL} - #{format_test_description(test_case, device)}: FAILED"
      if reason.to_s.empty? || file.to_s.empty?
        return knock_result
      end
      knock_result +
      format_failure_diagnostics(test_suite, test_case, reason, file)
    end

    def format_test_summary(executed_message, failures_per_suite)
      ''
    end

    def format_failure_diagnostics(test_suite, test_case, reason, file)
      format_diagnostics(reason) +
      format_diagnostics("  #{file}: #{test_suite} - #{test_case}")
    end

    private

    def format_diagnostics(text)
      "\n# #{text}"
    end

    def format_test_description(test_case, device)
      if device.to_s.empty?
        test_case
      else
        "#{test_case} on #{device}"
      end
    end

  end

end

