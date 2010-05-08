@checkbox
Feature: interacting with checkboxes
    As a tester
    In order to do my job
    I want to be able to interact with checkboxes

    Scenario: check and uncheck a checkbox
    Given I start the WpfTest app and wait for the main window
    Then the checkbox is unchecked
    When I check the checkbox
    Then the checkbox is checked
    When I uncheck the checkbox
    Then the checkbox is unchecked