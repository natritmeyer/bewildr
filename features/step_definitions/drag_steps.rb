Given /^I select the drag'n'drop tab$/ do
  @main_window.get(:id => "main_tabs").select("drag'n'drop") if @main_window.get(:id => "main_tabs").selected.name != "drag'n'drop"
end

Then /^I can get hold of the bewildr mouse$/ do
  Bewildr::Mouse.should be_an_instance_of(Class)
end

Then /^the mouse responds to the drag method$/ do
  Bewildr::Mouse.should respond_to(:drag)
end

Then /^I can drag the label from one point to another by referencing the element$/ do
  drag_label  = @main_window.get(:id => "drag_lbl")
  drag_target = @main_window.get(:id => "drag_target")
  Bewildr::Mouse.drag(:from => drag_label, :to => drag_target)
end

Then /^I can drag the label from one point to another via yet another by referencing the elements$/ do
  drag_label  = @main_window.get(:id => "drag_lbl")
  drag_target = @main_window.get(:id => "drag_target")
  drag_via_me = @main_window.get(:id => "drag_via_me")
  Bewildr::Mouse.drag(:from => drag_label, :via => drag_via_me, :to => drag_target, :wait_at_via_for => 0.5)
end