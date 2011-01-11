@drag
Feature: drag and drop
    As a tester
    In order to do my job
    I want to be able to drag and drop ui elements

    Scenario: be able to get a handle on the mouse
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can get hold of the bewildr mouse
    And the mouse responds to the drag method

    @wip
    Scenario: drag the label from one point to another
    Given I ensure that there are no instances of the test app running
    Given I start the test app
    And I select the drag'n'drop tab
    Then I can drag the label from one point to another by referencing the element