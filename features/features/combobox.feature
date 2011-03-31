@combobox
Feature: checkbox interaction
    As a tester
    In order to do my job
    I want to be able to interact with comboboxes

    Scenario: select a value and get selected text from a combobox
    Given I start the test app
    And I select the combobox tab
    When I select zero from the combobox
    Then the selected combobox item is zero
    
    Scenario: get count of combo box items
    Given I start the test app
    And I select the combobox tab
    Then there are ten combobox items

    Scenario: get list of combo box item names
    Given I start the test app
    And I select the combobox tab
    Then the items in the combobox match the expected items

    Scenario: select combo box item by index
    Given I start the test app
    And I select the combobox tab
    When I select the 4th combobox item by its index
    Then the selected combobox item is three

    Scenario: empty array returned when there are no combo items
    Given I start the test app
    And I select the combobox tab
    When I get the items out of the empty combobox
    Then the empty combobox returns an empty array