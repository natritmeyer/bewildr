Given /^I start the WpfTest app$/ do
  @app = Bewildr::Application.start("features/support/BewildrTestApp.exe")
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
  @app, @main_window = Bewildr::Application.start_app_and_wait_for_window("features/support/BewildrTestApp.exe", /Bewildr Test App/)
end