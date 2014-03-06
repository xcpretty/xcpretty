When(/^I run xcpretty$/) do
  @output = `bin/xcpretty 2>&1`
end

When(/^I run xcpretty with (.*)$/) do |flags|
  @output = `bin/xcpretty #{flags}`
end

When(/^I run xcpretty over a big file$/) do
  start_time = Time.now
  @output = `cat features/fixtures/xcodebuild_huge.log | bin/xcpretty -c`
  @xcpretty_run_time = Time.now - start_time
end

When /^I run xpretty -t over a file with a test suite that did not complete$/ do
  @output = `cat features/fixtures/xcodebuild_truncated.log | bin/xcpretty -t`
end

When /^I run xpretty -t over a file with a test suite that completed$/ do
  @output = `cat features/fixtures/xcodebuild_good.log | bin/xcpretty -t`
end

Then(/^I should see the help banner$/) do
  run_output.should include("Usage: xcodebuild [options] | xcpretty")
end

Then(/^I should see the xcpretty version$/) do
  run_output.should include(XCPretty::VERSION)
end

Then(/^the exit status code should be (\d)$/) do |numbah|
  $?.exitstatus.should == numbah.to_i
end

Then(/^the performance should be way faster than running cat$/) do
  puts "XCPretty run time: #{@xcpretty_run_time}"
  @xcpretty_run_time.should < 2
end
