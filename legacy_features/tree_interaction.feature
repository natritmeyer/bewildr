@tree
Feature: tree interaction
    As a tester
    In order to do my job
    I want to be able to select items in a tree and check to see which item is selected

    Scenario: select a tree node
    Given I start the WpfTest app and wait for the main window
    When I select the root node
    Then the root node is selected
    When I select the grandchild node
    Then the grandchild node is selected

    Scenario: check to see if a node exists
    Given I start the WpfTest app and wait for the main window
    Then the grandchild tree node exists
    And a nonexistent tree node within an existing tree node does not exist
    And a nonexistent tree node does not exist