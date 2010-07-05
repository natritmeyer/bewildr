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
  @main_window.get(:id => "dataGrid1").column_headers.first.name.should match("col 1")
end

Then /^the second column is called col 2$/ do
  @main_window.get(:id => "dataGrid1").column_headers[1].name.should match("col 2")
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

When /^I set the third cell in the first row to girl$/ do
  @main_window.get(:id => "dataGrid1").cell(0,2).text = "girl"
end

Then /^the third cell in the first row contains girl$/ do
  @main_window.get(:id => "dataGrid1").cell(0,2).text.should match("girl")
end

Then /^the first cell in the first row has a column span of 1$/ do
  @main_window.get(:id => "dataGrid1").cell(0,0).column_span.should == 1
end

Then /^the first cell in the first row has a row span of 1$/ do
  @main_window.get(:id => "dataGrid1").cell(0,0).row_span.should == 1
end
