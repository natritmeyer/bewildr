Given /^I start the WpfTest app$/ do
  @app = Bewildr::Application.start("white_wpf_test_app/WindowsPresentationFramework.exe")
end

When /^I check to see if the WpfTest app is running$/ do
  @app.should be_running
end

Then /^the WpfTest app is running$/ do
  @app.should be_running
end

When /^I close the WpfTest app$/ do
  @app.kill
end

Then /^the WpfTest app is not running$/ do
  @app.should_not be_running
end

Given /^I start the WpfTest app and wait for the main window$/ do
  @app, @main_window = Bewildr::Application.start_app_and_wait_for_window("white_wpf_test_app/WindowsPresentationFramework.exe", /Form1/)
end