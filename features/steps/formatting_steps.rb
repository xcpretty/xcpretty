Given(/^I have a file to compile$/) do
  add_run_input SAMPLE_COMPILE
end

Given(/^I have a precompiled header$/) do
  add_run_input SAMPLE_PRECOMPILE
end

Given(/^I have a failing test in my suite$/) do
  add_run_input SAMPLE_SPECTA_FAILURE
end

Given(/^all of my tests will pass in my suite$/) do
  3.times { add_run_input SAMPLE_OCUNIT_TEST }
end

Given(/^I have a passing test in my suite$/) do
  add_run_input SAMPLE_OCUNIT_TEST
end

Given(/^I start a test suite$/) do
  add_run_input SAMPLE_OCUNIT_SUITE_BEGINNING
end

Given(/^I finish a test suite$/) do
  add_run_input SAMPLE_OCUNIT_SUITE_COMPLETION
end

When(/^I pipe to xcpretty with "(.*?)"$/) do |flags|
  run_xcpretty(flags)
end

Then(/^I should see a successful compilation message$/) do
  run_output.should start_with("Compiling")
end

Then(/^I should see a successful precompilation message$/) do
  run_output.should start_with("Precompiling")
end

Then(/^I should see a green success icon$/) do
  run_output.should start_with("#{GREEN_START}✓#{COLOR_END}")
end

Then(/^I should see a failed test icon$/) do
  run_output.should start_with("F")
end

Then(/^I should see a passing test icon in ASCII$/) do
  run_output.should start_with(".")
end

Then(/^I should see a red failed test icon$/) do
  run_output.should include("#{RED_START}F#{COLOR_END}")
end

Then(/^the final execution message should be (red|green)$/) do |color|
  last_line = run_output.lines.last
  start_color = color == "red" ? RED_START : GREEN_START
  last_line.should start_with(start_color)
  last_line.strip.should end_with(COLOR_END)
end

Then(/^I should see a green passing test icon$/) do
  run_output.should include("#{GREEN_START}.#{COLOR_END}")
end

Then(/^I should see the name of a failed test$/) do
  run_output.should =~ FAILING_TEST_NAME_MATCHER
end

Then(/^I should see the path of a failed test$/) do
  run_output.should =~ TEST_PATH_MATCHER
end

Then(/^I should see the name of a passing test$/) do
  run_output.should =~ PASSING_TEST_NAME_MATCHER
end

Then(/^I should not see the path of a passing test$/) do
  run_output.should_not =~ TEST_PATH_MATCHER
end

Then(/^I should see that the test suite started$/) do
  run_output.should =~ TEST_SUITE_BEGINNING_MATCHER
end

Then(/^I should see that the test suite finished$/) do
  run_output.strip.should =~ TEST_SUITE_COMPLETION_MATCHER
end

Then(/^I should see a red failed test mark$/) do
  run_output.should include("#{RED_START}✗#{COLOR_END}")
end

Then(/^I should see a green passing test mark$/) do
  run_output.should include("#{GREEN_START}✓#{COLOR_END}")
end