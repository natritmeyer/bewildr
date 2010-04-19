When /^I enter some text into the text field$/ do
  @main_window.get(:id => "textBoxInsidePanel").text = "some text"
end

Then /^the text field contains the value I entered$/ do
  @main_window.get(:id => "textBoxInsidePanel").text.should match("some text")
end

Then /^the label contains Text changed$/ do
  @main_window.get(:id => "result").text.should match("Text changed")
end