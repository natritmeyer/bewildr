@list
Feature: list interaction
    As a tester
    In order to do my job
    I want to be able to select list items and get selected list items

    Scenario: select a list item and get selected list item
    Given I start the WpfTest app and wait for the main window
    When I select One from the right hand list
    Then the selected item in the right hand list is One