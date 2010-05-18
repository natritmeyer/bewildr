Given /^I select the combobox tab$/ do
  @main_window.get(:id => "main_tabs").select("listboxes") if @main_window.get(:id => "main_tabs").selected.name != "listboxes"
end

Then /^there are ten combobox items$/ do
  @main_window.get(:id => "comboBox1").count.should == 10
end

When /^I select zero from the combobox$/ do
  @main_window.get(:id => "comboBox1").select("Zero")
end

Then /^the selected combobox item is zero$/ do
  @main_window.get(:id => "comboBox1").selected.should match("Zero")
end

Then /^the items in the combobox match the expected items$/ do
  @main_window.get(:id => "comboBox1").items.should == %w{Zero One Two Three Four Five Six Seven Eight Nine}
end

When /^I select the 4th combobox item by its index$/ do
  @main_window.get(:id => "comboBox1").select(3)
end

Then /^the selected combobox item is three$/ do
  @main_window.get(:id => "comboBox1").selected.should match("Three")
end
