@list
Feature: list interaction
    As a tester
    In order to do my job
    I want to be able to interact with list boxes

    Scenario: get list box items from single select list
    Given I start the test app
    And I select the list tab
    Then the single select list box contains the expected items

    Scenario: get list box items from multi select list
    Given I start the test app
    And I select the list tab
    Then the multi select list box contains the expected items

    Scenario: select item from single select list
    Given I start the test app
    And I select the list tab
    When I select Zero from the single select list box
    Then the first item from the single select list box is selected

    Scenario: select item by index from single select list
    Given I start the test app
    And I select the list tab
    When I select the second item from the single select list box
    Then the second item from the single select list box is selected

    Scenario: select item from single select list then select another
    Given I start the test app
    And I select the list tab
    When I select Zero from the single select list box
    Then the first item from the single select list box is selected
    When I select Three from the single select list box
    Then the single select list box selected item is Three

    Scenario: select item far down the list
    Given I start the test app
    And I select the list tab
    When I select the last item in the single select list box
    Then the selected item is twentyone

    Scenario: select item from multi select list
    Given I start the test app
    And I select the list tab
    When I select Zero from the multi select list box
    Then the first item from the multi select list box is selected

    Scenario: no items selected in single select list
    Given I ensure that there are no instances of the test app running
    When I start the test app
    And I select the list tab
    Then there are no selected items in the single select list box