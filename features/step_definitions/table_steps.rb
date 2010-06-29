Given /^I select the tables tab$/ do
  @main_window.get(:id => "main_tabs").select("tables") if @main_window.get(:id => "main_tabs").selected.name != "tables"
end

Then /^the column count for the table is 3$/ do
  @main_window.get(:id => "dataGrid1").column_count.should == 3
end

Then /^the row count for the table is 3$/ do
  @main_window.get(:id => "dataGrid1").row_count.should == 3
end

Then /^the first column is called col 1$/ do
  @main_window.get(:id => "dataGrid1").column_headers[0].name.should match("col 1")
end

Then /^the column names are called col 1, col 2, col 3$/ do
  @main_window.get(:id => "dataGrid1").column_header_names.should == ["col 1", "col 2", "col 3"]
end

Then /^the first cell in the first row contains 1$/ do
  @main_window.get(:id => "dataGrid1").cell(0,0).text.should match("1")
end

Then /^the second cell in the second row contains Bob$/ do
  @main_window.get(:id => "dataGrid1").cell(1,1).text.should match("Bob")
end

Then /^the third cell in the third row contains bad$/ do
  @main_window.get(:id => "dataGrid1").cell(2,2).text.should match("bad")
end