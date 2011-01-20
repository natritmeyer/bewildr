Then /^the toggle button is untoggled$/ do
  @main_window.get(:id => "toggle_button").toggle_state.should == :off
end

When /^I toggle on the toggle button$/ do
  @main_window.get(:id => "toggle_button").toggle_on
end

Then /^the toggle button is toggled$/ do
  @main_window.get(:id => "toggle_button").toggle_state.should == :on
end

When /^I toggle off the toggle button$/ do
  @main_window.get(:id => "toggle_button").toggle_off
end

When /^I toggle the button$/ do
  @main_window.get(:id => "toggle_button").toggle
end