@tab
Feature: tab interaction
    As a tester
    In order to do my job
    I want to be able to select tabs and see which one is open

    Scenario: tab interaction
    Given I start the WpfTest app and wait for the main window
    Then the Spring tab is selected
    And the Autumn tab is unselected
    And the Winter tab is unselected
    When I select the Autumn tab
    Then the Spring tab is unselected
    And the Winter tab is unselected

    Scenario: getting the currently selected tab in the tab group
    Given I start the WpfTest app and wait for the main window
    Then the tab group reports that the currently selected item is Spring
    When I get the tab group to select Winter
    Then the tab group reports that the currently selected item is Winter