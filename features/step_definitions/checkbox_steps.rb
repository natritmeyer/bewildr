Given /^I select the checkbox tab$/ do
  @main_window.get(:id => "main_tabs").select("checks/radio") if @main_window.get(:id => "main_tabs").selected.name != "checks/radio"
end

Then /^the two state checkbox is unchecked$/ do
  @main_window.get(:id => "two_state_checkbox").should_not be_checked
  @main_window.get(:id => "two_state_checkbox").should be_unchecked
  @main_window.get(:id => "two_state_checkbox").checked_state.should == :off
end

When /^I check the two state checkbox$/ do
  @main_window.get(:id => "two_state_checkbox").check
end

Then /^the two state checkbox is checked$/ do
  @main_window.get(:id => "two_state_checkbox").should be_checked
  @main_window.get(:id => "two_state_checkbox").should_not be_unchecked
  @main_window.get(:id => "two_state_checkbox").checked_state.should == :on
end

When /^I uncheck the two state checkbox$/ do
  @main_window.get(:id => "two_state_checkbox").uncheck
end

Then /^I can't check a disabled checkbox$/ do
  lambda { @main_window.get(:id => "disabled_checkbox").check }.should raise_error(ElementNotEnabled)
end