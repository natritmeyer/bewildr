Then /^the progress bar value is 50$/ do
  @main_window.get(:id => "progressBar").value.should == 50
end

Then /^the minimum value of the progress bar is 0$/ do
  @main_window.get(:id => "progressBar").minimum.should == 0
end

Then /^the maximum value of the progress bar is 100$/ do
 @main_window.get(:id => "progressBar").maximum.should == 100
end