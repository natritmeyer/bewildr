Then /^the button in the group box exists$/ do
  @main_window.get(:id => "buttonInGroupBox").should exist
end

Then /^a non existent element does not exist$/ do
  @main_window.get(:id => "I dont exist").should_not exist
end

When /^I check to see if the button in the group box is enabled$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the button in the group box is enabled$/ do
  @main_window.get(:id => "buttonInGroupBox").should be_enabled
end

When /^I click the disabled controls button$/ do
  @main_window.get(:id => "disableControls").click
end

Then /^the text field is disabled$/ do
  @main_window.get(:id => "textBox").should_not be_enabled
end

Then /^bewildr complains that the non existent element does not exist$/ do
  lambda {@main_window.get(:id => "I dont exist").enabled?}.should raise_error(Bewildr::ElementDoesntExist)
end

When /^I get the link by specifying more than one condition$/ do
  @link_find_by_multiple_conditions = @main_window.get(:type => :hyperlink, :name => "Link Text")
end

Then /^I have a reference to the link$/ do
  @link_find_by_multiple_conditions.should exist
end

When /^I wait for existence of an object$/ do
  @main_window.wait_for_existence_of(:id => "textBox")
end

Then /^that object exists$/ do
  @main_window.get(:id => "textBox").should exist
end