@combobox
Feature: checkbox interaction
    As a tester
    In order to do my job
    I want to be able to interact with comboboxes

    @wip
    Scenario: select a value and get selected text from a combobox
    Given I start the test app
    And I select the combobox tab
    When I select zero from the combobox
    Then the selected combobox item is zero

    Scenario: select combobox item using regex
    
    Scenario: get count of combo box items
    Given I start the test app
    And I select the combobox tab
    Then there are ten combobox items

    Scenario: get list of combo box item names
    Scenario: select combo box item by index
    