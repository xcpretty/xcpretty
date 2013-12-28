Feature: Showing RSpec-style test output

    Scenario: Showing failed tests
        Given I have a failing test in my suite
        When I pipe to xcpretty with "--test"
        Then I should see a failed test icon

    Scenario: Showing passing tests
        Given I have a passing test in my suite
        When I pipe to xcpretty with "--test"
        Then I should see a passing test icon in ASCII

    Scenario: Showing some tests failed with color
        Given I have a failing test in my suite
        And the test suite has finished
        When I pipe to xcpretty with "--test --color"
        Then I should see a red failed test icon
        And I should see the path of a failed test
        And the final execution message should be red

    Scenario: Showing passing tests with colorization
        Given I have a passing test in my suite
        When I pipe to xcpretty with "--test --color"
        Then I should see a green passing test icon

    Scenario: Showing that all tests passed with color
        Given all of my tests will pass in my suite
        When I pipe to xcpretty with "--test --color"
        Then the final execution message should be green
