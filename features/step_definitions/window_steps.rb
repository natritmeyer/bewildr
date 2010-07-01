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

Then /^the window is normal$/ do
  @main_window.visual_state.should == :normal
end

When /^I minimize the window$/ do
  @main_window.minimize
end

Then /^the window is minimized$/ do
  @main_window.visual_state.should == :minimized
end

When /^I maximize the window$/ do
  @main_window.maximize
end

Then /^the window is maximized$/ do
  @main_window.visual_state.should == :maximized
end

When /^I restore the window$/ do
  @main_window.restore
end

Then /^the window name is Bewildr Test App$/ do
  @main_window.name.should match("Bewildr Test App")
end

When /^I close the main window$/ do
  @main_window.close
end

Then /^the main window does not exist$/ do
  @main_window.should_not exist
end