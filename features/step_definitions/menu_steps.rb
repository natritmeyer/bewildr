Given /^I select the menu tab$/ do
  @main_window.get(:id => "main_tabs").select("menus") if @main_window.get(:id => "main_tabs").selected.name != "menus"
end

Then /^the main menu contains Menu One and Menu Two$/ do
  @main_window.get(:id => "main_menu").root_menu_item_names.should == ["Menu One", "Menu Two"]
end

Then /^Menu One contains item two$/ do
  @main_window.get(:id => "main_menu").contains_menu_item?(["Menu One", "item two"]).should be_true
end

When /^I select Menu One, item one$/ do
  @main_window.get(:id => "main_menu").select_menu(["Menu One", "item one"])
end

Then /^the first level menu message box indicates that the menu item was selected$/ do
  @main_window.get(:id => "top_level_menu_result").text.should match("selected!")
end