@radio
Feature: radio interaction
    As a tester
    In order to do my job
    I want to be able to interact with radio buttons

    Scenario: get state of unselected radio button
    Given I start the test app
    And I select the radio tab
    Then the third radio button is unselected

    Scenario: select radio button
    Given I start the test app
    And I select the radio tab
    When I select the first radio button
    Then the first radio button is selected

    Scenario: select radio button using click
    Given I start the test app
    And I select the radio tab
    When I select the second radio button using click
    Then the second radio button is selected
    And the third radio button is unselected

    @wip
    Scenario: cycle through radio buttons
    Given I start the test app
    And I select the radio tab
    When I loop through each radio button, clicking each one
    Then the third radio button is selected