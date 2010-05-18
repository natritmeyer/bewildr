Given /^I select the radio tab$/ do
  @main_window.get(:id => "main_tabs").select("checks/radio") if @main_window.get(:id => "main_tabs").selected.name != "checks/radio"
end

Then /^the third radio button is unchecked$/ do
  @main_window.get(:id => "radioButton3").should_not be_selected
end

When /^I select the first radio button$/ do
  @main_window.get(:id => "radioButton1").select
end

Then /^the first radio button is selected$/ do
  @main_window.get(:id => "radioButton1").should be_selected
end