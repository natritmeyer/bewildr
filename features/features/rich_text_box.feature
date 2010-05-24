@rich_text_box
Feature: rich text box interaction
    As a tester
    In order to do my job
    I want to be able to interact with rich text boxes

    @wip
    Scenario: get and set the contents of a rich text box
    Given I start the test app
    And I select the textfields tab
    When I enter some text into the rich text box
    Then the rich text box contains the text I entered