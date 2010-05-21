@tab
Feature: list interaction
    As a tester
    In order to do my job
    I want to be able to interact with tabs

    Scenario: get number of tabs
    Given I start the test app
    Then there are 8 tabs

    Scenario: get tab names
    Given I start the test app
    Then the tab names are the expected ones

    Scenario: select tab
    Given I start the test app
    And I select the listboxes tab
    Then the selected tab is named listboxes
    When I select the menu tab
    Then the selected tab is named menu

    Scenario: no tab by that name
    Given I start the test app
    Then bewildr throws an exception if I try to access a non-existent tab