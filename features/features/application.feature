@application
Feature: Application interaction
    As a tester
    In order to do my job
    I want to be able to start, stop and get the status of the app I'm testing

    Scenario: Start an app from scratch
    Given I ensure that there are no instances of the test app running
    When I start the test app from scratch
    Then the test app is running

    Scenario: 'Attach or Launch' from scratch
    Given I ensure that there are no instances of the test app running
    When I start the app using attach or launch
    Then the test app is running

    Scenario: 'Attach or Launch' when recycling an old app
    Given I ensure that there are no instances of the test app running
    And I start the test app from scratch
    When I start the app using attach or launch
    Then the test app is running
    And there is only one instance of the test app running

    Scenario: Kill an app
    Given I ensure that there are no instances of the test app running
    And I start the test app from scratch
    When I terminate the app with extreme prejudice
    Then the app is no longer running

    Scenario: Launch app, wait for it, then attach to it
    Given I ensure that there are no instances of the test app running
    When I start the test app without getting a reference to it
    And I then wait for the app to appear
    Then I have a reference to the test app

    Scenario: Attempt starting a non existent app
    Given I have a path to an exe which does not exist
    Then bewildr complains when it cannot find the exe

    Scenario: Start app with command line arguments
    Given I ensure that there are no instances of the test app running
    When I start the app with some command line arguments
    And I select the basic elements tab
    Then the command line arguments I passed are displayed

    @wip
    Scenario: Get the app process id
    Given I ensure that there are no instances of the test app running
    And I start the test app from scratch
    When the test app is running
    Then the process id can be asked for and is correct

    @wip
    Scenario: Get the app process name
    Given I ensure that there are no instances of the test app running
    And I start the test app from scratch
    When the test app is running
    Then the process name can be asked for and is correct