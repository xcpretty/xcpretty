Feature: Showing RSpec-style test output

Scenario: Showing failed tests
Given I have a failing test in my suite
When I run piping with options "--test"
Then I should see a failed test icon

Scenario: Showing passing tests
Given I have a passing test in my suite
When I run piping with options "--test"
Then I should see a passing test icon

Scenario: Showing some tests failed with colorization
Given I have a failing test in my suite
When I run piping with options "--test --color"
Then I should see a red failed test icon
And the final execution message should be red

Scenario: Showing passing tests with colorization
Given I have a passing test in my suite
When I run piping with options "--test --color"
Then I should see a green passing test icon

Scenario: Showing that all tests passed with color
Given all of my tests will pass in my suite
When I run piping with options "--test --color"
Then the final execution message should be green