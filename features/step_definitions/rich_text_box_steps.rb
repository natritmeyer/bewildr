Given /^I select the textfields tab$/ do
  @main_window.get(:id => "main_tabs").select("text fields") if @main_window.get(:id => "main_tabs").selected.name != "text fields"
end

When /^I enter some text into the rich text box$/ do
  @main_window.get(:id => "richTextBox1").text = "some text"
end

Then /^the rich text box contains the text I entered$/ do
  @main_window.get(:id => "richTextBox1").text.should match("some text")
end

When /^I enter some different text into the rich text box$/ do
  @main_window.get(:id => "richTextBox1").text = "some more text"
end

Then /^the rich text box contains the different text$/ do
  @main_window.get(:id => "richTextBox1").text.should match("some more text")
end

When /^I enter some text containing a \\n character$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the text field contains a return character where expected$/ do
  pending # express the regexp above with the code you wish you had
end