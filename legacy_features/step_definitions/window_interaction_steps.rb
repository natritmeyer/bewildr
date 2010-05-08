When /^I wait for the main window$/ do
  @main_window = @app.wait_for_window(/Form1/)
end

Then /^the main window appears$/ do
  @main_window.should be_open
end

When /^I close the main window$/ do
  @main_window.close
end

Then /^the main window does not exist$/ do
  @main_window.should_not be_open
end

When /^I (maximize|minimize|restore) the main window$/ do |action|
  case action
  when "maximize" then @main_window.maximize
  when "minimize" then @main_window.minimize
  when "restore"  then @main_window.restore
  end
end

Then /^the main window is (maximized|minimized|normal)$/ do |state|
  case state
  when "maximized" then @main_window.visual_state.should == :maximized
  when "minimized" then @main_window.visual_state.should == :minimized
  when "normal"    then @main_window.visual_state.should == :normal
  end
end

When /^I open the close me message box$/ do
  @main_window.get(:id => "buttonLaunchesMessageBox").click
  @close_me_message_box = @app.wait_for_window(/Close Me/)
end

Then /^the close me message box is open$/ do
  @close_me_message_box.should be_open
end

When /^I close the close me message box$/ do
  @close_me_message_box.close
  @close_me_message_box.wait_for_close
end

Then /^the close me message box is closed$/ do
  @close_me_message_box.should_not be_open
end

When /^I open the modal window box$/ do
  @main_window.get(:id => "launchModal").click
  @modal_window = @app.wait_for_window(/ModalForm/)
end

Then /^the modal window is open$/ do
  @modal_window.should be_open
end

When /^I close the modal window$/ do
  @modal_window.close
end

Then /^the modal window is closed$/ do
  @modal_window.should_not be_open
end

Then /^the main window name should be Form1$/ do
  @main_window.name.should match("Form1")
end