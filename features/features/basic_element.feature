@basic
Feature: basic element interaction
    As a tester
    In order to do my job
    I want to be able to interact with objects, ie: click, check state, check existence etc

    Scenario: check for existence of an element which exists
    Given I start the test app
    And I select the basic elements tab
    Then the first button exists

    Scenario: check for existence of an element which doesn't exist
    Given I start the test app
    And I select the basic elements tab
    Then a non existent element does not exist

    Scenario: check for visibility of an element
    Given I start the test app
    And I select the basic elements tab
    Then the enabled button is visible

    Scenario: check for enabledness of an enabled element
    Given I start the test app
    And I select the basic elements tab
    Then the enabled button is enabled

    Scenario: check for nonenabledness of a disabled element
    Given I start the test app
    And I select the basic elements tab
    Then the disabled button is disabled

    Scenario: check for enabledness of a non existent element
    Given I start the test app
    And I select the basic elements tab
    Then bewildr complains that the non existent element does not exist

    Scenario: get an object using more than one condition
    Given I start the test app
    And I select the basic elements tab
    When I get the enabled button by specifying more than one condition
    Then I have a reference to the button

    Scenario: wait for existence of an object
    Given I start the test app
    And I select the basic elements tab
    When I wait for existence of an element
    Then the element that I waited for exists

    Scenario: one element contains another
    Given I start the test app
    And I select the basic elements tab
    Then the basic elements tab contains the enabled button

    Scenario: click an element
    Given I start the test app
    And I select the basic elements tab
    When I click the enabled button
    Then the result message says clicked!

    Scenario: double click an element
    Given I start the test app
    And I select the basic elements tab
    When I double click the double click label
    Then the double click result message says double clicked!

    Scenario: get name of an element
    Given I start the test app
    And I select the basic elements tab
    Then the click for existence test button name is 'click for existence test'

    Scenario: get automation id of an element
    Given I start the test app
    And I select the basic elements tab
    Then the automation id of the enabled button is enabled_button

    Scenario: get the width and height of an element
    Given I start the test app
    And I select the basic elements tab
    Then the height of the enabled button is as expected
    And the width of the enabled button is as expected

    @wip
    Scenario: how_many returns an empty array when no elements match
    Given I start the test app
    And I select the basic elements tab
    When I look for all elements with automation id of flibble
    Then an empty array is returned

    @wip
    Scenario: how_many returns an array with one element when one matches
    Given I start the test app
    And I select the basic elements tab
    When I look for all elements with automation id of toggle_button
    Then an array containing one element returned

    @wip
    Scenario: use how_many to get all matching objects
    Given I start the test app
    And I select the basic elements tab
    When I look for all button elements
    Then an array containing a number of elements is returned