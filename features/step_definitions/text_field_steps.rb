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

Then /^the label text is as expected$/ do
  @main_window.get(:id => "label1").text.should match("a label with some text")
end

When /^I enter some text into the password field$/ do
  @main_window.get(:id => "password_field").text = "p4ssw0rd"
end

Then /^bewildr complains on attempting to read the password field$/ do
  lambda { @main_window.get(:id => "password_field").text }.should raise_error PasswordFieldReadAttempt
end