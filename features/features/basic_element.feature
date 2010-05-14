@basic
Feature: basic element interaction
    As a tester
    In order to do my job
    I want to be able to interact with objects, ie: click, check state, check existence etc

    Scenario: check for existence of an element which exists
    Given I start the test app
    And I select the basic elements tab
    Then the first button exists

    @wip
    Scenario: check for existence of an element which doesn't exist
    Given I start the test app
    And I select the basic elements tab
    Then a non existent element does not exist

    Scenario: check for enabledness of an enabled element
    Given I start the test app
    Then the button in the group box is enabled

    Scenario: check for nonenabledness of a disabled element
    Given I start the test app
    When I click the disabled controls button
    Then the text field is disabled

    Scenario: check for enabledness of a non existent element
    Given I start the test app
    Then bewildr complains that the non existent element does not exist

    Scenario: get an object using more than one condition
    Given I start the test app
    When I get the link by specifying more than one condition
    Then I have a reference to the link

    Scenario: wait for existence of an object
    Given I start the test app
    When I wait for existence of an object
    Then that object exists