When /^I click the button in the group box$/ do
  @main_window.get(:id => "buttonInGroupBox").click
end

Then /^some label text is upadted as a result$/ do
  @main_window.get(:id => "result").text.should match("Button In GroupBox Clicked")
end

Then /^I can get the name of the button in the group box$/ do
  @main_window.get(:id => "buttonInGroupBox").name.should match("Button In Group Box")
end