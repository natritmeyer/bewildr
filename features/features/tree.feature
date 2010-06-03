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
    Scenario: double click a node
