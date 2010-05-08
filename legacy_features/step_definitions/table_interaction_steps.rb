Then /^the table has 3 columns$/ do
  @main_window.get(:id => "listView").column_count.should == 3
end

Then /^the table has 6 rows$/ do
  @main_window.get(:id => "listView").row_count.should == 6
end

Then /^the table has 3 column headers$/ do
  @main_window.get(:id => "listView").column_headers.size.should == 3
end

Then /^the table column headers are blank, key and value$/ do
  @main_window.get(:id => "listView").column_header_names.should == ["", "Key", "Value"]
end

Then /^I can click on a table header$/ do
  @main_window.get(:id => "listView").column_headers.last.click
end