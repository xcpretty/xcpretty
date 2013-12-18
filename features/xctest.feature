Feature: Status codes

    Scenario: Xcode tests have failed
        Given I have a failing test in my suite
        When I pipe to xcpretty
        Then the exit status code should be 1

    Scenario: Xcode build has failed
        Given the tests have failed building
        When I pipe to xcpretty
        Then the exit status code should be 1


    Scenario: Xcode build has failed
        Given the build has failed
        When I pipe to xcpretty
        Then the exit status code should be 1
