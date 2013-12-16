Then(/^I should see a failed test node in my report$/) do
  junit_report.root.elements.to_a.detect do |node|
    element = node.elements.to_a.first
    element && element.name == "failure"
  end.should_not be_nil
end

Then(/^I should see a passing test node in my report$/) do
  junit_report.root.elements.to_a.detect do |node|
    node.attributes["time"] != nil
  end.should_not be_nil
end

Then(/^I should see a test suite node$/) do
  junit_report.root.should_not be_nil
end

Then(/^I should see (\d+) tests in my report$/) do |test_count|
  junit_report.root.attributes["tests"].should == test_count
  junit_report.root.elements.to_a.count.should == test_count.to_i
end