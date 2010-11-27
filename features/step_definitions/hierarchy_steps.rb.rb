Then /^the tab is the parent object of the enabled button$/ do
  @main_window.get(:id => "enabled_button").parent.class.should == Bewildr::Element
  @main_window.get(:id => "enabled_button").parent.name.should == "basic"
  @main_window.get(:id => "enabled_button").parent.control_type.should == :tab_item
end

Then /^the enabled button is not the root object$/ do
  @enabled_button = @main_window.get(:id => "enabled_button")
  @enabled_button.should_not be_root
end

When /^I cycle up the object tree$/ do
  @root_element = @enabled_button.parent.parent.parent.parent
  @root_element.should be_root
end

Then /^the root object is at the top of the tree$/ do
  @root_element.should be_root
  @root_element.parent.should be_nil
end

Then /^the bars tab has 2 children$/ do
  bars_tab = @main_window.get(:id => "tab_bars")
  bars_tab.should have_children
end

Then /^the progress bar has no children$/ do
  @main_window.get(:id => "progressBar1").should_not have_children
end