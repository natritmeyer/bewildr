@radio
Feature: radio button interaction
    As a tester
    In order to do my job
    I want to be able to get the state of and select a radio button

    Scenario: get state of a select radio buttons
    Given I start the WpfTest app and wait for the main window
    Then neither radio button is selected
    When I select the foo radio
    Then the foo radio is selected
    And the bar radio is unselected
    When I select the bar radio
    Then the bar radio is selected
    And the foo radio is unselected