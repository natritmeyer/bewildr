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
  lambda {@main_window.get(:id => "I dont exist").enabled?}.should raise_error(Bewildr::ElementDoesntExist)
end

When /^I get the enabled button by specifying more than one condition$/ do
  @button = @main_window.get(:id => "enabled_button", :type => :button)
end

Then /^I have a reference to the button$/ do
  @button.should exist
end

When /^I wait for existence of an element$/ do
  @main_window.get(:id => "wait_for_existence_button").click
  @suddenly_exists_button = @main_window.wait_for_existence_of(:name => "suddenly exists")
end

Then /^the element that I waited for exists$/ do
  @suddenly_exists_button.should exist
end

When /^I click the enabled button$/ do
  @main_window.get(:id => "enabled_button").click
end

Then /^the result message says clicked!$/ do
  @main_window.get(:id => "enabled_button_message").text.should match("clicked!")
end

Then /^the basic elements tab contains the enabled button$/ do
  @main_window.get(:id => "tab_basic").contains?(:id => "enabled_button").should be_true
end

Then /^the click for existence test button name is 'click for existence test'$/ do
  @main_window.get(:id => "wait_for_existence_button").name.should match("click for existence test")
end

Then /^the automation id of the enabled button is enabled_button$/ do
  @main_window.get(:id => "enabled_button").automation_id.should match("enabled_button")
end

When /^I double click the double click label$/ do
  @main_window.get(:id => "double_click_me").double_click
end

Then /^the double click result message says double clicked!$/ do
  @main_window.get(:id => "double_click_result").text.should match("double clicked!")
end