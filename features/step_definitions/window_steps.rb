When /^I try to get a reference to the main window$/ do
  @main_window = @app.wait_for_window("Bewildr Test App")
end

Then /^I have a reference to a window$/ do
  @main_window.control_type.should == :window
end