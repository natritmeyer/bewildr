@table
Feature: table interaction
    As a tester
    In order to do my job
    I want to be able to interact with tables

    Scenario: column count
    Given I start the test app
    And I select the tables tab
    Then the column count for the table is 3

    Scenario: row count
    Given I start the test app
    And I select the tables tab
    Then the row count for the table is 3

    Scenario: column span
    Scenario: row span
    