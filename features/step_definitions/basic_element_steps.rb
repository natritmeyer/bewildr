Given /^I select the basic elements tab$/ do
  @main_window.get(:id => "main_tabs").select("basic")
end

Then /^the first button exists$/ do
  @main_window.get(:id => "enabled_button").should exist
end

Then /^a non existent element does not exist$/ do
  @main_window.get(:id => "i dont exist").should_not exist
end