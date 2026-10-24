Feature: Parsing Swift Testing output

    Scenario: Showing a passing swift testing test
        Given I start a swift testing run
        And I have a passing swift testing test in my suite
        And the swift testing run has passed
        When I pipe to xcpretty with "--test --no-color"
        Then I should see a passing test icon in ASCII
        And I should see a swift testing summary

    Scenario: Showing some swift testing tests failed with color
        Given I start a swift testing run
        And I have a failing swift testing test in my suite
        And the swift testing run has failed
        When I pipe to xcpretty with "--test --color"
        Then I should see a red failed test icon
        And I should see the name of the failed swift testing test
        And I should see the reason of the failed swift testing test
        And I should see a swift testing summary

    Scenario: Showing a skipped swift testing test
        Given I start a swift testing run
        And I have a skipped swift testing test in my suite
        And the swift testing run has passed
        When I pipe to xcpretty with "--test --no-color"
        Then I should see a pending test icon in ASCII
        And I should see a swift testing summary

    Scenario: Reporting swift testing results to junit
        Given I start a swift testing run
        And I have a failing swift testing test in my suite
        And I have a passing swift testing test in my suite
        And I have a skipped swift testing test in my suite
        And the swift testing run has failed
        When I pipe to xcpretty with "--report junit"
        Then I should see a failed test node in my report
        And I should see a passing test node in my report
        And I should see a pending test node in my report
        And I should see 3 tests in my swift testing report
