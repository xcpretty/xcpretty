Then(/^I should have a JSON compilation database in a custom path$/) do
  step("I should have a JSON compilation database at \"#{custom_report_path}\"")
end

Then(/^I should have a JSON compilation database at "(.*?)"$/) do |path|
  json = JSON.parse(File.open(path, 'r').read)
  json.should_not be_nil
end

Then(/^I should have JSON compilation databases in two custom paths$/) do
  step("I should have a JSON compilation database at \"#{custom_report_path}\"")
  step("I should have a JSON compilation database at \"#{other_custom_report_path}\"")
end

Then(/^the JSON compilation database should contain a corresponding entry$/) do
  json = JSON.parse(File.open(custom_report_path, 'r').read)
  json.length.should == 1

  json[0]["command"].should start_with("/Applications/Xcode.app/Contents/Developer")
  json[0]["command"].should end_with(".o")

  json[0]["file"].should == "NSMutableArray+ObjectiveSugar.m"
  json[0]["directory"].should == "/Users/musalj/code/OSS/ObjectiveSugar/Classes"
end

Given(/^some big input$/) do
  add_run_input File.open('features/fixtures/xcodebuild.log', 'r').read
end

Then(/^the JSON compilation database should be complete$/) do
  json = JSON.parse(File.open(custom_report_path, 'r').read)
  json.length.should == 557
  
  for entry in json do
    entry['command'].should_not be_nil
    entry['file'].should_not be_nil
    entry['directory'].should_not be_nil
  end
end
