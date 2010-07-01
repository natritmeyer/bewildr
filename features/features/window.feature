@window
Feature: Window interaction
    As a tester
    In order to do my job
    I want to be able to interact with windows

    @wip
    Scenario: get a reference to a window
    Given I ensure that there are no instances of the test app running
    And I start the test app from scratch
    When I try to get a reference to the main window
    Then I have a reference to a window