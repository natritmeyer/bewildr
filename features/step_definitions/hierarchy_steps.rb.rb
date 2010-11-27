Then /^the tab is the parent object of the enabled button$/ do
  @main_window.get(:id => "enabled_button").parent.class.should == Bewildr::Element
  @main_window.get(:id => "enabled_button").parent.name.should == "basic"
  @main_window.get(:id => "enabled_button").parent.control_type.should == :tab_item
end

When /^I cycle up the object tree$/ do
  pending
end

Then /^the root object is at the top of the tree$/ do
  pending
end

Then /^the bars tab has 2 children$/ do
  pending
end

Then /^the progress bar has no children$/ do
  pending
end