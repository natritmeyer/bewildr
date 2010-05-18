Given /^I select the radio tab$/ do
  @main_window.get(:id => "main_tabs").select("checks/radio") if @main_window.get(:id => "main_tabs").selected.name != "checks/radio"
end

Then /^the first radio button is unchecked$/ do
  @main_window.get(:id => "radioButton1").should_not be_selected
end