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

    Scenario: single column name
    Given I start the test app
    And I select the tables tab
    Then the first column is called col 1

    Scenario: all column names
    Given I start the test app
    And I select the tables tab
    Then the column names are called col 1, col 2, col 3

    Scenario: get table cell content
    Given I start the test app
    And I select the tables tab
    Then the first cell in the first row contains 1
    And the second cell in the second row contains Bob
    And the third cell in the third row contains bad

    Scenario: set table cell content
    Given I start the test app
    And I select the tables tab
    When I set the third cell in the first row to girl
    Then the third cell in the first row contains girl

    Scenario: column span
    Given I start the test app
    And I select the tables tab
    Then the first cell in the first row has a column span of 1

    Scenario: row span
    Given I start the test app
    And I select the tables tab
    Then the first cell in the first row has a row span of 1