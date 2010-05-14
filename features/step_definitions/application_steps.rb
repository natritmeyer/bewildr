Given /^I ensure that there are no instances of the test app running$/ do
  Bewildr::Application.kill_all_processes_with_name("BewildrTestApp")
end

When /^I start the test app from scratch$/ do
  @app = Bewildr::Application.start("features/support/BewildrTestApp.exe")
end

Then /^the test app is running$/ do
  @app.should be_running
end

When /^I start the app using attach or launch$/ do
  @app = Bewildr::Application.attach_or_launch("features/support/BewildrTestApp.exe")
end

Given /^I start the test app$/ do
  @app = Bewildr::Application.attach_or_launch("features/support/BewildrTestApp.exe")
  @main_window = @app.wait_for_window("Bewildr Test App")
end

Then /^there is only one instance of the test app running$/ do
  Bewildr::Application.processes_with_name("BewildrTestApp").size.should == 1
end

When /^I terminate the app with extreme prejudice$/ do
  @app.kill
end

Then /^the app is no longer running$/ do
  @app.should_not be_running
end

When /^I start the test app without getting a reference to it$/ do
  #using this because it's the only thing that forks. backticks don't fork.
  System::Diagnostics::Process.Start("features/support/BewildrTestApp.exe")
end

When /^I then wait for the app to appear$/ do
  @app = Bewildr::Application.wait_for_process_with_name("BewildrTestApp")
end

Then /^I have a reference to the test app$/ do
  @app.should be_running
end
