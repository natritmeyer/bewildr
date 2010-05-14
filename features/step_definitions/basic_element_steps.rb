Given /^I select the basic elements tab$/ do
  puts @main_window
  @main_window.get(:id => "main_tabs").select("basic")
end

Then /^the first button exists$/ do
  @main_window.get(:id => "enabled_button").should exist
end