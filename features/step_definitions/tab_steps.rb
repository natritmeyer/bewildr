Then /^there are 8 tabs$/ do
  @main_window.get(:id => "main_tabs").tabs.size.should == 8
end

Then /^the tab names are the expected ones$/ do
  @main_window.get(:id => "main_tabs").tab_names.should == ["basic", "text fields", "checks/radio", "listboxes", "menus", "bars", "tables", "tree"]
end

Given /^I select the listboxes tab$/ do
   @main_window.get(:id => "main_tabs").select("listboxes")
end

Then /^the selected tab is named listboxes/ do
  @main_window.get(:id => "main_tabs").selected.name.should match("listboxes")
end

Then /^the selected tab is named menu$/ do
  @main_window.get(:id => "main_tabs").selected.name.should match("menus")
end

Then /^bewildr throws an exception if I try to access a non-existent tab$/ do
   lambda {@main_window.get(:id => "main_tabs").select("non existent")}.should raise_error(Bewildr::NoSuchTab)
end