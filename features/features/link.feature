@link
Feature: link interaction
    As a tester
    In order to do my job
    I want to be able to interact with links

    Scenario: get link text
    Given I start the test app
    And I select the link tab
    Then the link text is Label

    @wip
    Scenario: click a link
    Given I start the test app
    And I select the link tab
    When I click the link
    Then the link result message displays the success message
