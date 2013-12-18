Given(/^the build has failed$/) do
  add_run_input "** BUILD FAILED **"
end

Given(/^the tests have failed building$/) do
  add_run_input "** TEST FAILED **"
end

Then(/^the exit status code should be (\d)$/) do |numbah|
  $?.exitstatus.should == numbah.to_i
end
