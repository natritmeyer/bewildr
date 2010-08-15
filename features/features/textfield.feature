@textfield
Feature: text field interaction
    As a tester
    In order to do my job
    I want to be able to interact with text fields

    Scenario: get and set value of text field
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the text field
    Then the text field contains the text I entered

    Scenario: overwrite value of text field
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the text field
    Then the text field contains the text I entered
    When I enter some different text into the text field
    Then the text field contains the different text

    Scenario: get value of label
    Given I start the test app
    And I select the textfields tab
    Then the label text is as expected

    Scenario: fail on reading attempt on password field
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the password field
    Then bewildr complains on attempting to read the password field
    And bewildr recognizes that the password field is a password field

    Scenario: attempt setting text of disabled text field
    Given I start the test app
    And I select the textfields tab
    Then I cannot set the text of a disabled text field
