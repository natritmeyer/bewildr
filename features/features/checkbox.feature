@checkbox
Feature: checkbox interaction
    As a tester
    In order to do my job
    I want to be able to interact with checkboxes

    @wip
    Scenario: get state of unchecked checkbox
    Given I start the test app
    And I select the checkbox tab
    Then the two state checkbox is unchecked

    Scenario: check a checkbox
    Given I start the test app
    And I select the checkbox tab
    
    Scenario: uncheck a checkbox
    Scenario: check a disabled checkbox
    Scenario: cycle through 2 state checkbox
    Scenario: cycle through 3 state checkbox