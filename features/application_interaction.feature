@application
Feature: Application interaction
    As a tester
    In order to do my job
    I want to be able to start, stop and get the status of the app I'm testing

    Scenario: Start an application
    Given I start the WpfTest app
    When I check to see if the WpfTest app is running
    Then the WpfTest app is running

    Scenario: Close an application
    Given I start the WpfTest app
    When I check to see if the WpfTest app is running
    Then the WpfTest app is running
    When I close the WpfTest app
    Then the WpfTest app is not running