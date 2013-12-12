Feature: Status codes

    Scenario: Xcode tests have failed
        Given I have a failing test in my suite
        When I pipe to xcpretty
        Then the exit status code should be 1
