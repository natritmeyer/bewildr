@textfield
Feature: Text field interaction
    As a tester
    In order to do my job
    I want to be able to interact with text fields

    Scenario: Get and set value of generic text field
    Given I start the WpfTest app and wait for the main window
    When I enter some text into the text field
    Then the text field contains the value I entered

    Scenario: Get text from a label
    Given I start the WpfTest app and wait for the main window
    Then the label contains Text changed