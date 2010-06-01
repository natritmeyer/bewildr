Given /^I select the tree tab$/ do
  @main_window.get(:id => "main_tabs").select("tree") if @main_window.get(:id => "main_tabs").selected.name != "tree"
end

Then /^the tree contains the level 3 tree item$/ do
  @main_window.get(:id => "treeView1").contains_node?(["Level 1", "Level 2", "Level 3"]).should be_true
end