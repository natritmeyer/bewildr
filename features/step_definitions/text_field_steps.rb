When /^I enter some text into the text field$/ do
  @main_window.get(:id => "enabled_text_field").text = "some text"
end

Then /^the text field contains the text I entered$/ do
  @main_window.get(:id => "enabled_text_field").text.should match("some text")
end

When /^I enter some different text into the text field$/ do
  @main_window.get(:id => "enabled_text_field").text = "some different text"
end

Then /^the text field contains the different text$/ do
  @main_window.get(:id => "enabled_text_field").text.should match("some different text")
end

Then /^bewildr complains if I try to enter text into the disabled text field$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the label text is as expected$/ do
  @main_window.get(:id => "label1").text.should match("a label with some text")
end