Given /^I select the drag'n'drop tab$/ do
  @main_window.get(:id => "main_tabs").select("drag'n'drop") if @main_window.get(:id => "main_tabs").selected.name != "drag'n'drop"
end

Then /^I can drag the label from one point to another by referencing the element$/ do
  drag_label  = @main_window.get(:id => "drag_lbl")
  drag_target = @main_window.get(:id => "drag_target")
  Bewildr::Mouse.drag(:from => drag_label, :to => drag_target)
  drag_target.text.should == "drag over registered"
end

Then /^I can drag the label from one point to another via yet another by referencing the elements$/ do
  drag_label  = @main_window.get(:id => "drag_lbl")
  drag_target = @main_window.get(:id => "drag_target")
  drag_via_me = @main_window.get(:id => "drag_via_me")
  Bewildr::Mouse.drag(:from => drag_label, :via => drag_via_me, :to => drag_target, :wait_at_via_for => 0.5)
  drag_via_me.text.should == "via drag registered"
  drag_target.text.should == "drag over registered"
end

Then /^I can drag the label element from one point to another$/ do
  label  = @main_window.get(:id => "drag_lbl")
  target = @main_window.get(:id => "drag_target")
  label.drag :to => target
  target.text.should == "drag over registered"
end

Then /^I can drag the label element from one point to another via yet another$/ do
  label  = @main_window.get(:id => "drag_lbl")
  target = @main_window.get(:id => "drag_target")
  way_point = @main_window.get(:id => "drag_via_me")
  label.drag :via => way_point, :to => target, :wait_at_via_for => 0.5
  way_point.text.should == "via drag registered"
  target.text.should == "drag over registered"
end