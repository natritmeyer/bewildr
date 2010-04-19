@basic
Feature: basic element interaction
    As a tester
    I want to be able to do basic interaction with elements
    In order to to stuff with them

    Scenario: check for existence of an element which exists
    Given I start the WpfTest app and wait for the main window
    Then the button in the group box exists

    Scenario: check for existence of an element which doesn't exist
    Given I start the WpfTest app and wait for the main window
    Then a non existent element does not exist

    Scenario: check for enabledness of an enabled element
    Given I start the WpfTest app and wait for the main window
    Then the button in the group box is enabled

    Scenario: check for nonenabledness of a disabled element
    Given I start the WpfTest app and wait for the main window
    When I click the disabled controls button
    Then the text field is disabled

    Scenario: check for enabledness of a non existent element
    Given I start the WpfTest app and wait for the main window
    Then bewildr complains that the non existent element does not exist

    @wip
    Scenario: get an object using more than one condition
    Given I start the WpfTest app and wait for the main window
    When I get the link by specifying more than one condition
    Then I have a reference to the link