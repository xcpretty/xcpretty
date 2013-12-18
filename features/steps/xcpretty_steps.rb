Given(/^the build has failed$/) do
  add_run_input "/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSArrayCategoriesTests.m:53:13: error: use of undeclared identifier 'something'"
end

Then(/^the exit status code should be (\d)$/) do |numbah|
  $?.exitstatus.should == numbah.to_i
end
