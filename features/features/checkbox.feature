@checkbox
Feature: checkbox interaction
    As a tester
    In order to do my job
    I want to be able to interact with checkboxes

    Scenario: get state of unchecked checkbox
    Given I start the test app
    And I select the checkbox tab
    Then the two state checkbox is unchecked

    Scenario: check a checkbox
    Given I start the test app
    And I select the checkbox tab
    When I check the two state checkbox
    Then the two state checkbox is checked
    
    Scenario: uncheck a checkbox / cycle through 2 state checkbox
    Given I start the test app
    And I select the checkbox tab
    When I check the two state checkbox
    Then the two state checkbox is checked
    When I uncheck the two state checkbox
    Then the two state checkbox is unchecked

    Scenario: get value of checkbox set to indeterminate state
    Given I start the test app
    And I select the checkbox tab
    Then the three state checkbox is set to indeterminate

    Scenario: check a disabled checkbox
    Given I start the test app
    And I select the checkbox tab
    Then I can't check a disabled checkbox