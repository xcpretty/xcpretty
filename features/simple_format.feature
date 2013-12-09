Feature: Showing build output in simple format

Scenario: Showing file compilation
Given I have a file to compile
When I run piping with options "--simple"
Then I should see a successful compilation message

Scenario: Showing precompilation
Given I have a precompiled header
When I run piping with options "--simple"
Then I should see a successful precompilation message

Scenario: Showing file compilation with colorization
Given I have a file to compile
When I run piping with options "--simple --color"
Then I should see a green success icon

Scenario: Showing precompilation
Given I have a precompiled header
When I run piping with options "--simple --color"
Then I should see a green success icon