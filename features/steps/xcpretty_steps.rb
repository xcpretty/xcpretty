Given(/^the build has failed$/) do
  add_run_input "/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSArrayCategoriesTests.m:53:13: error: use of undeclared identifier 'something'"
end

When(/^I run xcpretty$/) do
  @output = `bin/xcpretty 2>&1`
end

When(/^I run xcpretty with (.*)$/) do |flags|
  @output = `bin/xcpretty #{flags}`
end

When(/^I run xcpretty over a big file$/) do
  start_time = Time.now
  @output = `cat features/fixtures/xcodebuild.log | bin/xcpretty -c`
  @xcpretty_run_time = Time.now - start_time
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

Then(/^the performance should be (\d+) times faster than running cat$/) do |numbah|
  cat_start = Time.now
  `cat features/fixtures/xcodebuild.log`.each_line do |line|
    # this is pretty horrible right now, but the numbers are real.
    # We need to find a soultion with real numbers that doesn't
    # bloat the test output
    STDOUT.puts line
  end

  cat_run_time = Time.now - cat_start

  puts "XCPretty run time: #{@xcpretty_run_time}"
  puts "XCPretty run time * #{numbah}: #{@xcpretty_run_time * numbah.to_f}"
  puts "Cat run time: #{cat_run_time}"

  (@xcpretty_run_time * numbah.to_f).should < cat_run_time
end

