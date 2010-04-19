@table
Feature: table interaction
    As a tester
    In order to do my job
    I want to be able to get and set table values

    Scenario: get the row count of a table
    Given I start the WpfTest app and wait for the main window
    Then the table has 6 rows

    Scenario: get the column count of a table
    Given I start the WpfTest app and wait for the main window
    Then the table has 3 columns

    @wip
    Scenario: column header count
    Given I start the WpfTest app and wait for the main window
    Then the table has 3 column headers

    @wip
    Scenario: column header count
    Given I start the WpfTest app and wait for the main window
    Then the table column headers are blank, key and value

    @wip
    Scenario: click on table headers
    Given I start the WpfTest app and wait for the main window
    Then I can click on a table header