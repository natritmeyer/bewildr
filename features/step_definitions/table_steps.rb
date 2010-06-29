Given /^I select the tables tab$/ do
  @main_window.get(:id => "main_tabs").select("tables") if @main_window.get(:id => "main_tabs").selected.name != "tables"
end

Then /^the column count for the table is 3$/ do
  @main_window.get(:id => "dataGrid1").column_count.should == 3
end

Then /^the row count for the table is 3$/ do
  @main_window.get(:id => "dataGrid1").row_count.should == 3
end