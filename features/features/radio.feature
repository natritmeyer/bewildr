@radio
Feature: radio interaction
    As a tester
    In order to do my job
    I want to be able to interact with radio buttons

    @wip
    Scenario: get state of unselected radio button
    Given I start the test app
    And I select the radio tab
    Then the first radio button is unchecked