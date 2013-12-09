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

When(/^I run piping with options "(.*?)"$/) do |flags|
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
  run_output.should == "F"
end

Then(/^I should see a passing test icon$/) do
  run_output.should == "."
end

Then(/^I should see a red failed test icon$/) do
  run_output.should include("#{RED_START}F#{COLOR_END}")
end

Then(/^the final execution message should be (red|green)$/) do |color|
  last_line = run_output.lines.last
  start_color = color == "red" ? RED_START : GREEN_START
  last_line.should start_with(start_color)
  last_line.should end_with(COLOR_END)
end

Then(/^I should see a green passing test icon$/) do
  run_output.should include("#{GREEN_START}.#{COLOR_END}")
end