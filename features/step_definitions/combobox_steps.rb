Given /^I select the combobox tab$/ do
  @main_window.get(:id => "main_tabs").select("listboxes") if @main_window.get(:id => "main_tabs").selected.name != "listboxes"
end

Then /^there are ten combobox items$/ do
  @main_window.get(:id => "comboBox1").count.should == 10
end
