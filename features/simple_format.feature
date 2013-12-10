Feature: Showing build output in simple format

    Scenario: Showing file compilation
        Given I have a file to compile
        When I pipe to xcpretty with "--simple"
        Then I should see a successful compilation message

    Scenario: Showing precompilation
        Given I have a precompiled header
        When I pipe to xcpretty with "--simple"
        Then I should see a successful precompilation message

    Scenario: Showing file compilation with color
        Given I have a file to compile
        When I pipe to xcpretty with "--simple --color"
        Then I should see a green success icon

    Scenario: Showing precompilation
        Given I have a precompiled header
        When I pipe to xcpretty with "--simple --color"
        Then I should see a green success icon

    Scenario: Showing the start of a test run
        Given the tests start running
        When I pipe to xcpretty with "--simple"
        Then I should see that test suite has started

    Scenario: Showing the start of a test suite
        Given I start a test suite
        When I pipe to xcpretty with "--simple"
        Then I should see the name of suite only

    Scenario: Showing the end of a test suite
        Given I finish a test suite
        When I pipe to xcpretty with "--simple"
        Then I should see that the test suite finished

    Scenario: Showing failed test output
        Given I have a failing test in my suite
        When I pipe to xcpretty with "--simple"
        Then I should see the name of a failed test
        And I should see the path of a failed test

    Scenario: Showing successful test output
        Given I have a passing test in my suite
        When I pipe to xcpretty with "--simple"
        Then I should see the name of a passing test
        And I should not see the name of the test group
        And I should not see the path of a passing test

    Scenario: Showing failed test output with color
        Given I have a failing test in my suite
        And I finish a test suite
        When I pipe to xcpretty with "--simple --color"
        Then I should see a red failed test mark
        And the final execution message should be red

    Scenario: Showing successful test output with color
        Given I have a passing test in my suite
        And I finish a test suite
        When I pipe to xcpretty with "--simple --color"
        Then I should see a green passing test mark
