Feature: CLI behavior

    Scenario: Xcode tests have failed
        Given I have a failing test in my suite
        When I pipe to xcpretty
        Then the exit status code should be 1

    Scenario: Xcode build has failed
        Given the build has failed
        When I pipe to xcpretty
        Then the exit status code should be 1

    Scenario: Starting xcpretty without any flags
        When I run xcpretty
        Then I should see the help banner

    Scenario: Starting xcpretty with version
        When I run xcpretty with -v
        Then I should see the xcpretty version

    Scenario: Performance
        When I run xcpretty over a big file
        Then the performance should be 3 times faster than running cat

