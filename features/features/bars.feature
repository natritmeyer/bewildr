@bars
Feature: progress and sliding bars
    As a tester
    In order to do my job
    I want to be able to interact with progress and sliding bars

    Scenario: get max and min values of a progress bar
    Given I start the test app
    And I select the bars tab
    Then the max value of the progress bar is 100
    And the min value of the progress bar is 0
    
    Scenario: get max and min values of a sliding bar
    Given I start the test app
    And I select the bars tab
    Then the max value of the sliding bar is 10
    And the min value of the sliding bar is 0

    Scenario: get current value of a progress bar
    Given I start the test app
    And I select the bars tab
    Then the current value of the progress bar is 75

    Scenario: get current value of a sliding bar
    Given I start the test app
    And I select the bars tab
    Then the current value of the sliding bar is 3

    Scenario: change value of a sliding bar
    Given I start the test app
    And I select the bars tab
    Then the current value of the sliding bar is 3
    When I change the value of the sliding bar to 8
    Then the current value of the sliding bar is 8