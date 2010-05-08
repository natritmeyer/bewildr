@combobox
Feature: combobox interaction
    As a tester
    In order to do my job
    I want to be able to get and set combobox values

    Scenario: select a value and get selected text from a combobox
    Given I start the WpfTest app and wait for the main window
    When I select a value from the combobox
    Then the value I selected is the currently selected item

    Scenario: get count of combo box items
    Given I start the WpfTest app and wait for the main window
    When I get the number of items in the combobox
    Then the number of items is what I was expecting

    Scenario: get list of combo box item names
    Given I start the WpfTest app and wait for the main window
    When I get the combobox items
    Then the items are the ones I was expecting

    Scenario: select combo box item by index
    Given I start the WpfTest app and wait for the main window
    When I select the third item in the combobox
    Then the value I selected is 1