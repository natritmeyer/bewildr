@toggle
Feature: toggle button interaction
    As a tester
    In order to do my job
    I want to be able to interact with toggle buttons

    Scenario: Get the state of an untoggled toggle button
    Given I start the test app
    And I select the basic elements tab
    Then the toggle button is untoggled

    Scenario: Toggle a toggle button through the toggle states
    Given I start the test app
    And I select the basic elements tab
    Then the toggle button is untoggled
    When I toggle on the toggle button
    Then the toggle button is toggled
    When I toggle off the toggle button
    Then the toggle button is untoggled

    @wip
    Scenario: Toggle a button
    Given I start the test app
    And I select the basic elements tab
    Then the toggle button is untoggled
    When I toggle the button
    Then the toggle button is toggled
    When I toggle the button
    Then the toggle button is untoggled