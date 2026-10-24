# encoding: utf-8
Given(/^I start a swift testing run$/) do
  add_run_input SAMPLE_SWIFT_TESTING_RUN_STARTED
  add_run_input SAMPLE_SWIFT_TESTING_SUITE_STARTED
end

Given(/^I have a passing swift testing test in my suite$/) do
  add_run_input SAMPLE_SWIFT_TESTING_TEST_PASSED
end

Given(/^I have a failing swift testing test in my suite$/) do
  add_run_input SAMPLE_SWIFT_TESTING_TEST_STARTED
  add_run_input SAMPLE_SWIFT_TESTING_ISSUE
  add_run_input SAMPLE_SWIFT_TESTING_TEST_FAILED
end

Given(/^I have a skipped swift testing test in my suite$/) do
  add_run_input SAMPLE_SWIFT_TESTING_TEST_SKIPPED
end

Given(/^the swift testing run has passed$/) do
  add_run_input SAMPLE_SWIFT_TESTING_RUN_PASSED
end

Given(/^the swift testing run has failed$/) do
  add_run_input SAMPLE_SWIFT_TESTING_SUITE_FAILED
  add_run_input SAMPLE_SWIFT_TESTING_RUN_FAILED
end

Then(/^I should see a swift testing summary$/) do
  run_output.should include("Swift Testing: Test run")
end

Then(/^I should see the name of the failed swift testing test$/) do
  run_output.should include("add wrong")
end

Then(/^I should see the reason of the failed swift testing test$/) do
  run_output.should include("Expectation failed: stlib.add(2, 2) == 5")
end

Then(/^I should see (\d+) tests in my swift testing report$/) do |test_count|
  junit_report_root.attributes["tests"].to_i.should == test_count.to_i
  junit_report_root.attributes["failures"].to_i.should == 1
  junit_report_root.elements.to_a.size.should == test_count.to_i
end

