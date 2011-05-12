Given /^I select the list tab$/ do
  @main_window.get(:id => "main_tabs").select("listboxes") if @main_window.get(:id => "main_tabs").selected.name != "listboxes"
end

Then /^the single select list box contains the expected items$/ do
  @main_window.get(:id => "single_select_list_box").items.should == %w{Zero One Two Three Four 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 twentyone}
end

Then /^the multi select list box contains the expected items$/ do
  @main_window.get(:id => "multiple_select_list").items.should == %w{Zero One Two Three}
end

When /^I select Zero from the single select list box$/ do
  @main_window.get(:id => "single_select_list_box").select("Zero")
end

Then /^the first item from the single select list box is selected$/ do
  @main_window.get(:id => "single_select_list_box").selected.class.should == Bewildr::Element
  @main_window.get(:id => "single_select_list_box").selected.control_type.should == :list_item
  @main_window.get(:id => "single_select_list_box").selected.name.should match("Zero")
end

When /^I select the second item from the single select list box$/ do
  @main_window.get(:id => "single_select_list_box").select(1)
end

Then /^the second item from the single select list box is selected$/ do
  @main_window.get(:id => "single_select_list_box").selected.name.should match("One")
end

When /^I select Three from the single select list box$/ do
  @main_window.get(:id => "single_select_list_box").select("Three")
end

Then /^the single select list box selected item is Three$/ do
  @main_window.get(:id => "single_select_list_box").selected.name.should match("Three")
end

When /^I select Zero from the multi select list box$/ do
  @main_window.get(:id => "multiple_select_list").select("Zero")
end

Then /^the first item from the multi select list box is selected$/ do
  @main_window.get(:id => "multiple_select_list").selected.name.should match("Zero")
end

When /^I select the last item in the single select list box$/ do
  @main_window.get(:id => "single_select_list_box").select("twentyone")
end

Then /^the selected item is twentyone$/ do
  @main_window.get(:id => "single_select_list_box").selected.name.should match("twentyone")
end

Then /^there are no selected items in the single select list box$/ do
  @main_window.get(:id => "single_select_list_box").selected.should be_nil
end

When /^I get the items out of the empty list box$/ do
  @empty_list_items = @main_window.get(:id => "empty_list").list_items
end

Then /^the empty list box returns an empty array$/ do
  @empty_list_items.should be_empty
end