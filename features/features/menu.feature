@menu
Feature: list interaction
    As a tester
    In order to do my job
    I want to be able to interact with menus

    Scenario: main menu items existence
    Given I start the test app
    And I select the menu tab
    Then the main menu contains Menu One and Menu Two

    Scenario: menu contains menu item
    Given I start the test app
    And I select the menu tab
    Then Menu One contains item two

    @wip
    Scenario: select first level menu item
    Given I start the test app
    And I select the menu tab
    When I select Menu One, item one
    Then the first level menu message box indicates that the menu item was selected

    Scenario: select second level menu item
    Given I start the test app
    And I select the menu tab
    When I select
    Then the second level menu message box indicates that the menu item was selected

    Scenario: select third level menu item
    Given I start the test app
    And I select the menu tab
    When I select
    Then the third level menu message box indicates that the menu item was selected

