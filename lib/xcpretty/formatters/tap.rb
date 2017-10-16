module XCPretty

  class TestAnything < Knock

    attr_reader :counter

    def initialize(unicode, color)
      super
      @counter = 0
    end

    def format_passing_test(suite, test_case, device, time)
      increment_counter
      "#{PASS} #{counter} - #{format_test_description(test_case, device)}"
    end

    def format_failing_test(test_suite, test_case, device, reason, file)
      increment_counter
      tap_result = "#{FAIL} #{counter} - #{format_test_description(test_case, device)}"
      if reason.nil? || reason.empty? || file.nil? || file.empty?
        return tap_result
      end
      tap_result + format_failure_diagnostics(test_suite, test_case, reason, file)
    end

    def format_pending_test(test_suite, test_case, device)
      increment_counter
      "#{FAIL} #{counter} - #{format_test_description(test_case, device)} # TODO Not written yet"
    end

    def format_test_summary(executed_message, failures_per_suite)
      counter > 0 ? "1..#{counter}" : ''
    end

    private

    def format_test_description(test_case, device)
      if device.nil? || device.empty?
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

