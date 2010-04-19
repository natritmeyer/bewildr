@link
Feature: hyperlink interaction
    As a tester
    In order to do my job
    I want to be able to click links

    Scenario: click a link
    Given I start the WpfTest app and wait for the main window
    When I click on the Link Text link
    Then the label is displays Link label clicked

    Scenario: get link text
    Given I start the WpfTest app and wait for the main window
    Then the text of the first link is Link Text