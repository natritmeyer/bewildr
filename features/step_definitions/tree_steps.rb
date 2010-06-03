Given /^I select the tree tab$/ do
  @main_window.get(:id => "main_tabs").select("tree") if @main_window.get(:id => "main_tabs").selected.name != "tree"
end

Then /^the tree contains the level 3 tree item$/ do
  @main_window.get(:id => "treeView1").contains_node?(["Level 1", "Level 2", "Level 3"]).should be_true
end

When /^I expand the level 1 tree item$/ do
  @main_window.get(:id => "treeView1").node(["Level 1"]).expand
end

Then /^the level 1 tree item contains the level 2 tree item$/ do
  @main_window.get(:id => "treeView1").node(["Level 1"]).child_nodes.name.should match("Level 2")
end