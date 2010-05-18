@radio
Feature: radio interaction
    As a tester
    In order to do my job
    I want to be able to interact with radio buttons

    Scenario: get state of unselected radio button
    Given I start the test app
    And I select the radio tab
    Then the third radio button is unchecked

    @wip
    Scenario: select radio button
    Given I start the test app
    And I select the radio tab
    When I select the first radio button
    Then the first radio button is selected