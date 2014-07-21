Feature: CLI behavior

    Scenario: Starting xcpretty without any flags
        When I run xcpretty
        Then I should see the help banner

    Scenario: Starting xcpretty with version
        When I run xcpretty with -v
        Then I should see the xcpretty version

    Scenario: Performance
        When I run xcpretty over a big file
        Then the performance should be way faster than running cat

    Scenario: Rspec test suite does not complete
        When I run xpretty -t over a file with a test suite that did not complete
        Then the exit status code should be 1
        And I should see the last started test's name "SK_AuthenticationViewController"

    Scenario: Rspec test suite completes
        When I run xpretty -t over a file with a test suite that completed
        Then the exit status code should be 0

    Scenario: Handles multiple test suites
        When I run xcpretty -t over a file containing multiple test suites
        Then the exit status code should be 0
        And I should see 2 sets of test results
