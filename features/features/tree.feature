@tree
Feature: tree interaction
    As a tester
    In order to do my job
    I want to be able to interact with trees

    Scenario: check to see if a node exists
    Given I start the test app
    And I select the tree tab
    Then the tree contains the level 3 tree item

    Scenario: get list of child nodes
    Given I start the test app
    And I select the tree tab
    When I expand the level 1 tree item
    Then the level 1 tree item contains the level 2 tree item

    Scenario: select a node
    Given I start the test app
    And I select the tree tab
    When I select the level 1 tree item
    Then the level 1 tree item is selected
    When I select the level 2 tree item
    Then the level 2 tree item is selected

    Scenario: double click a node
    Given I start the test app
    And I select the tree tab
    When I double click the level 1 tree item
    Then the result message displays the level 1 double click message
    When I double click the level 2 tree item
    Then the result message displays the level 2 double click message
    When I double click the level 3 tree item
    Then the result message displays the level 3 double click message
