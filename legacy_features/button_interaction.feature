@button
Feature: Button interaction
    As a tester
    In order to do my job
    I want to be able to click buttons

    Scenario: click a button
    Given I start the WpfTest app and wait for the main window
    When I click the button in the group box
    Then some label text is upadted as a result

    Scenario: error on clicking disabled button
    Given I start the WpfTest app and wait for the main window
    Then I can get the name of the button in the group box