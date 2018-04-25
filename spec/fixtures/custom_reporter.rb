# encoding: utf-8
class DogeReporter < XCPretty::Reporter

  def format_failing_device_test(suite, test_case, reason, file, device)
    @test_count += 1
    @fail_count += 1
    @tests.push("WOW such FAIL. Many #{test_case}. Much #{reason}. Very #{file}.")
  end

  def format_passing_device_test(suite, test_case, time, device)
    @test_count += 1
    @tests.push("WOW such PASS. Many #{test_case}. Much green. Very success.")
  end

  def format_pending_device_test(classname, test_case, device)
    @test_count += 1
    @tests.push("WOW such PENDING. Many #{test_case}. Much stop. Very wait.")
  end

  def write_report
    File.open(@filepath, 'w') do |f|
      output_string = @tests.join("\n")
      output_string += "\nWOW such FINISH. Very #{@test_count}. Much #{@fail_count} FAIL. Very done."
      f.write output_string
    end
  end
end

DogeReporter

