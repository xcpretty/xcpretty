Then(/^I should see a test suite section in HTML$/) do
  html_test_suites.first.should_not be_nil
end

Then(/^I should see a failed test in HTML$/) do
  html_report_body.get_elements("//section[@class='test failing']/").to_a.size.should_not == 0
end

Then(/^I should see a passing test in HTML$/) do
  html_report_body.get_elements("//section[@class='test passing']/").to_a.size.should_not == 0
end

Then(/^I should see (\d+) tests in HTML$/) do |test_count|
  test_section = html_test_suites.first.get_elements("//section[@class='tests']/").first
  tests = test_section.elements.to_a.select {|e| e.attributes['class'].include? 'test'}
  tests.size.should == test_count.to_i
end

Then(/^I should see (\d+) test suite sections? in HTML$/) do |section_count|
  html_test_suites.size.should == section_count.to_i
end
