@progress
Feature: progress bar interaction
    As a tester
    In order to do my job
    I want to be able to check the values of a progress bar

    Scenario: get the current value of a progress bar
    Given I start the WpfTest app and wait for the main window
    Then the progress bar value is 50

    Scenario: get the minimum value of a progress bar
    Given I start the WpfTest app and wait for the main window
    Then the minimum value of the progress bar is 0

    Scenario: get the maximum value of a progress bar
    Given I start the WpfTest app and wait for the main window
    Then the maximum value of the progress bar is 100