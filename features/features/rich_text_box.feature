@rich_text_box
Feature: rich text box interaction
    As a tester
    In order to do my job
    I want to be able to interact with rich text boxes

    Scenario: get and set the contents of a rich text box
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the rich text box
    Then the rich text box contains the text I entered

    Scenario: overwrite value in rich text box
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the rich text box
    Then the rich text box contains the text I entered
    When I enter some different text into the rich text box
    Then the rich text box contains the different text

    @wip
    Scenario: text with newlines
    Given I start the test app
    And I select the textfields tab
    When I enter some text containing a \n character
    Then the text field contains a return character where expected