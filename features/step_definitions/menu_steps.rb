Given /^I select the menu tab$/ do
  @main_window.get(:id => "main_tabs").select("menus") if @main_window.get(:id => "main_tabs").selected.name != "menus"
end

Then /^the main menu contains Menu One and Menu Two$/ do
  @main_window.get(:id => "main_menu").root_menu_item_names.should == ["Menu One", "Menu Two"]
end