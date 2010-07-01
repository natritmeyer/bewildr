When /^I try to get a reference to the main window$/ do
  @main_window = @app.wait_for_window("Bewildr Test App")
end

Then /^I have a reference to a window$/ do
  @main_window.control_type.should == :window
end

When /^I look for the window by string$/ do
  @main_window = @app.wait_for_window("Bewildr Test App")
end

When /^I look for the window by regex$/ do
  @main_window = @app.wait_for_window(/B\w+ T\w+ A\w+/)
end

Then /^the number of windows belonging to the app is 1$/ do
  @app.windows.size.should == 1
end

Then /^I cannot get a reference to a nonexistent window$/ do
  @app.window('i dont exist').should == nil
end