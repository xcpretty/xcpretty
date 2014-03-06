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

    Scenario: Test suite does not complete
       When I run xpretty over a file with a test suite that did not complete
       Then the exit status code should be 1
