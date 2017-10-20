module XCPretty

  class TestAnything < Knock

    attr_reader :counter

    def initialize(unicode, color)
      super
      @counter = 0
    end

    def format_passing_device_test(suite, test_case, time, device)
      increment_counter
      "#{PASS} #{counter} - #{format_test_description(test_case, device)}"
    end

    def format_failing_device_test(test_suite, test_case, reason, file, device)
      increment_counter
      test_description = format_test_description(test_case, device)
      tap_result = "#{FAIL} #{counter} - #{test_description}"
      if reason.to_s.empty? || file.to_s.empty?
        return tap_result
      end
      tap_result +
      format_failure_diagnostics(test_suite, test_case, reason, file)
    end

    def format_pending_device_test(test_suite, test_case, device)
      increment_counter
      test_description = format_test_description(test_case, device)
      "#{FAIL} #{counter} - #{test_description} # TODO Not written yet"
    end

    def format_test_summary(executed_message, failures_per_suite)
      counter > 0 ? "1..#{counter}" : ''
    end

    private

    def format_test_description(test_case, device)
      if device.to_s.empty?
        test_case
      else
        "#{test_case} on #{device}"
      end
    end

    def increment_counter
      @counter += 1
    end
  end

end

