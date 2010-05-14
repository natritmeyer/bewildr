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

Then /^the disabled button is disabled$/ do
 @main_window.get(:id => "disabled_button").should_not be_enabled
end

Then /^bewildr complains that the non existent element does not exist$/ do
  lambda {@main_window.get(:id => "I dont exist").enabled?}.should raise_error(ElementDoesntExist)
end

When /^I get the enabled button by specifying more than one condition$/ do
  @button = @main_window.get(:id => "enabled_button", :type => :button)
end

Then /^I have a reference to the button$/ do
  @button.should exist
end