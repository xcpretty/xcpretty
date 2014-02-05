Given(/^I have tests in my suite from 2 classes$/) do
  add_run_input SAMPLE_OCUNIT_TEST
  add_run_input SAMPLE_KIWI_TEST
end

When(/^I pipe to xcpretty with "(.*?)" and specify a custom path$/) do |args|
  step("I pipe to xcpretty with \"#{args} --output #{custom_report_path}\"")
end

When(/^I pipe to xcpretty with two custom report paths$/) do
  step("I pipe to xcpretty with \"--report junit --output #{custom_report_path} --report junit --output #{other_custom_report_path}\"")
end

Then(/^I should have test reports in two custom paths$/) do
  step("I should have a test report at \"#{custom_report_path}\"")
  step("I should have a test report at \"#{other_custom_report_path}\"")
end

Then(/^I should have a test report in a custom path$/) do
  step("I should have a test report at \"#{custom_report_path}\"")
end

Then(/^I should see a failed test node in my report$/) do
  junit_report_root.elements.to_a.detect do |node|
    element = node.elements.to_a.first
    element && element.name == "failure"
  end.should_not be_nil
end

Then(/^I should see a passing test node in my report$/) do
  junit_report_root.elements.to_a.detect do |node|
    node.attributes["time"] != nil
  end.should_not be_nil
end

Then(/^I should see a test suite node$/) do
  junit_report_root.elements.to_a.first.should_not be_nil
end

Then(/^I should see (\d+) tests in my report$/) do |test_count|
  junit_report_root.attributes["tests"].should == test_count
  junit_report_root.elements.to_a.count.should == test_count.to_i
end

Then(/^I should see (\d+) test suites$/) do |count|
  suites = junit_report.root.elements.to_a
  suites.size.should == count.to_i
  suites.select {|s| s.name == 'testsuite' }.size.should == count.to_i
end

Then(/^I should have a test report at "(.*?)"$/) do |path|
  doc = REXML::Document.new(File.open(path, 'r').read)
  doc.root.should_not be_nil
end
