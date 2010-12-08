@hierarchy
Feature: object hierarchy navigation
    As a tester
    In order to be able to navigate the object hierarchy
    I want to have easy access to an object's parent or children

    Scenario: get a parent object
    Given I start the test app
    And I select the basic elements tab
    Then the tab is the parent object of the enabled button

    Scenario: stop at the root element
    Given I start the test app
    And I select the basic elements tab
    Then the enabled button is not the root object
    When I cycle up the object tree
    Then the root object is at the top of the tree

    Scenario: get children objects
    Given I start the test app
    And I select the bars tab
    Then the bars tab has 2 children

    Scenario: object has no children
    Given I start the test app
    And I select the bars tab
    Then the progress bar has no children
