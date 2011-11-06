@drag
Feature: drag and drop
    As a tester
    In order to do my job
    I want to be able to drag and drop ui elements

	Scenario: drag the label from one point to another
    Given I ensure that there are no instances of the test app running
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can drag the label from one point to another by referencing the element

    Scenario: drag the label from one point to the other via another label
    Given I ensure that there are no instances of the test app running
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can drag the label from one point to another via yet another by referencing the elements
	
	Scenario: drag the label from one point to the other using the Element
	Given I ensure that there are no instances of the test app running
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can drag the label element from one point to another

	Scenario: drag the label from one point to the other via another label using the element
    Given I ensure that there are no instances of the test app running
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can drag the label element from one point to another via yet another