Then /^the (Spring|Autumn|Winter) tab is selected$/ do |tab|
  case tab
  when "Spring" then @main_window.get(:id => "Spring").should be_selected
  when "Autumn" then @main_window.get(:id => "Autumn").should be_selected
  when "Winter" then @main_window.get(:id => "Winter").should be_selected
  end
end

Then /^the (Spring|Autumn|Winter) tab is unselected$/ do |tab|
  case tab
  when "Spring" then @main_window.get(:id => "Spring").should be_unselected
  when "Autumn" then @main_window.get(:id => "Autumn").should be_unselected
  when "Winter" then @main_window.get(:id => "Winter").should be_unselected
  end
end

When /^I select the Autumn tab$/ do
  @main_window.get(:id => "Autumn").select
end

Then /^the tab group reports that the currently selected item is (Spring|Winter)$/ do |season|
#  @main_window.get(:id => "seasons").selected.should match(season)
  @main_window.get(:id => "seasons").selected.name.should match(season)
end

When /^I get the tab group to select Winter$/ do
  @main_window.get(:id => "seasons").select("Winter")
end