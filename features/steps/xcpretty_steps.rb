Given(/^the build has failed$/) do
  add_run_input "/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSArrayCategoriesTests.m:53:13: error: use of undeclared identifier 'something'"
end

When(/^I run xcpretty$/) do
  @output = `bin/xcpretty 2>&1`
end

When(/^I run xcpretty with (.*)$/) do |flags|
  @output = `bin/xcpretty #{flags}`
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

