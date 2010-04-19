@menu
Feature: menu interaction
    As a tester
    In order to do my job
    I want to be able to select items from menus

    Scenario: select menu item
    Given I start the WpfTest app and wait for the main window
    When I select File, Click Me from the menu
    Then the result text field contains Click Me Clicked

    @wip
    Scenario: test for menu item existence
    Given I start the WpfTest app and wait for the main window
    Then the File, Click Me menu item exists
    And a nonexistent menu item within an existing menu does not exist
    And a nonexistent menu item does not exist