When /^I select File, Click Me from the menu$/ do
  #puts @main_window.get(:id => "menu1").root_menu_items.inspect
  @main_window.get(:id => "menu1").select_menu(["File", "Click Me"])
end

Then /^the result text field contains Click Me Clicked$/ do
  @main_window.get(:id => "result").text.should match("Click Me Clicked")
end

Then /^the File, Click Me menu item exists$/ do
  @main_window.get(:id => "menu1").contains_menu_item?(["File", "Click Me"]).should be_true
end

Then /^a nonexistent menu item within an existing menu does not exist$/ do
  @main_window.get(:id => "menu1").contains_menu_item?(["File", "nonexistent"]).should be_false
end

Then /^a nonexistent menu item does not exist$/ do
  @main_window.get(:id => "menu1").contains_menu_item?(["nonexistent", "nonexistent"]).should be_false
end