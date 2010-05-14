Given /^I select the basic elements tab$/ do
  @main_window.get(:id => "main_tabs").select("basic") if @main_window.get(:id => "main_tabs").selected.name != "basic"
end

Then /^the first button exists$/ do
  @main_window.get(:id => "enabled_button").should exist
end

Then /^a non existent element does not exist$/ do
  @main_window.get(:id => "i dont exist").should_not exist
end

Then /^the enabled button is enabled$/ do
  @main_window.get(:id => "enabled_button").should be_enabled
end