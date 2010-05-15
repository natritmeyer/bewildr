Given /^I select the bars tab$/ do
  @main_window.get(:id => "main_tabs").select("bars") if @main_window.get(:id => "main_tabs").selected.name != "bars"
end

Then /^the max value of the progress bar is 100$/ do
  @main_window.get(:id => "progressBar1").maximum.should == 100
end

Then /^the min value of the progress bar is 0$/ do
  @main_window.get(:id => "progressBar1").minimum.should == 0
end

Then /^the max value of the sliding bar is 10$/ do
  @main_window.get(:id => "slider1").maximum.should == 10
end

Then /^the min value of the sliding bar is 0$/ do
  @main_window.get(:id => "slider1").minimum.should == 0
end

Then /^the current value of the progress bar is 75$/ do
  @main_window.get(:id => "progressBar1").value.should == 75
end

Then /^the current value of the sliding bar is 3$/ do
  @main_window.get(:id => "slider1").value.should == 3
end

When /^I change the value of the sliding bar to 8$/ do
  @main_window.get(:id => "slider1").value = 8
end

Then /^the current value of the sliding bar is 8$/ do
  @main_window.get(:id => "slider1").value.should == 8
end