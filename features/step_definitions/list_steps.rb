Given /^I select the list tab$/ do
  @main_window.get(:id => "main_tabs").select("listboxes") if @main_window.get(:id => "main_tabs").selected.name != "listboxes"
end

Then /^the single select list box contains the expected items$/ do
  @main_window.get(:id => "single_select_list_box").items.should == %w{Zero One Two Three}
end

Then /^the multi select list box contains the expected items$/ do
  @main_window.get(:id => "multiple_select_list").items.should == %w{Zero One Two Three}
end