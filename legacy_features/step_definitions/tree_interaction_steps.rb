When /^I select the root node$/ do
  @main_window.get(:id => "ped").select_node(["Root"])
end

Then /^the root node is selected$/ do
  @main_window.get(:id => "ped").selected.name.should match("Root")
end

When /^I select the grandchild node$/ do
  @main_window.get(:id => "ped").select_node(["Root", "Child", "Grand Child"])
end

Then /^the grandchild node is selected$/ do
  @main_window.get(:id => "ped").selected.name.should match("Grand Child")
end

Then /^the grandchild tree node exists$/ do
  @main_window.get(:id => "ped").contains_node?(["Root", "Child", "Grand Child"]).should be_true
end

Then /^a nonexistent tree node does not exist$/ do
  @main_window.get(:id => "ped").contains_node?(["nonexistent", "nonexistent"]).should be_false
end

Then /^a nonexistent tree node within an existing tree node does not exist$/ do
  @main_window.get(:id => "ped").contains_node?(["Root", "Child", "nonexistent"]).should be_false
end