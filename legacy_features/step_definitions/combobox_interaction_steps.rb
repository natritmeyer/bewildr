When /^I select a value from the combobox$/ do
  @main_window.get(:id => "komboBox").select("Arundhati Roy")
end

Then /^the value I selected is the currently selected item$/ do
  @main_window.get(:id => "komboBox").selected.should match("Arundhati Roy")
end

When /^I get the number of items in the combobox$/ do
  @number_of_items = @main_window.get(:id => "komboBox").count
end

Then /^the number of items is what I was expecting$/ do
  @number_of_items.should eql(10)
end

When /^I get the combobox items$/ do
  @combobox_items = @main_window.get(:id => "komboBox").items
end

Then /^the items are the ones I was expecting$/ do
  @combobox_items.should eql(["Arundhati Roy", "Noam Chomsky", "1", "2", "3", "4", "5", "6", "7", "ReallyReallyLongTextHere"])
end

When /^I select the third item in the combobox$/ do
  @main_window.get(:id => "komboBox").select(2)
end

Then /^the value I selected is 1$/ do
  @main_window.get(:id => "komboBox").selected.should match("1")
end