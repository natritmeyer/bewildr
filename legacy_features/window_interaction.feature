@window
Feature: Window interaction
    As a tester
    In order to do my job
    I want to be able to wait for windows; close windows; maximize, minimize and restore them, etc

    Scenario: wait for a window to appear
    Given I start the WpfTest app
    When I wait for the main window
    Then the main window appears

    Scenario: close a window
    Given I start the WpfTest app
    When I wait for the main window
    Then the main window appears
    When I close the main window
    Then the main window does not exist

    Scenario: minimize, maximize and restore a window
    Given I start the WpfTest app and wait for the main window
    When I maximize the main window
    Then the main window is maximized
    When I minimize the main window
    Then the main window is minimized
    When I restore the main window
    Then the main window is normal

    Scenario: open and close message box
    Given I start the WpfTest app and wait for the main window
    When I open the close me message box
    Then the close me message box is open
    When I close the close me message box
    Then the close me message box is closed

    Scenario: open and close modal window
    Given I start the WpfTest app and wait for the main window
    When I open the modal window box
    Then the modal window is open
    When I close the modal window
    Then the modal window is closed

    Scenario: get window name
    Given I start the WpfTest app and wait for the main window
    Then the main window name should be Form1