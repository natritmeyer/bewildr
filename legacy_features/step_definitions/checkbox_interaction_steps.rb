Then /^the checkbox is (unchecked|checked)$/ do |state|
  case state
  when "unchecked" then @main_window.get(:id => "chequeBox").should be_unchecked
  when "checked"   then @main_window.get(:id => "chequeBox").should be_checked
  end
end

When /^I (check|uncheck) the checkbox$/ do |action|
  case action
  when "uncheck" then @main_window.get(:id => "chequeBox").uncheck
  when "check"   then @main_window.get(:id => "chequeBox").check
  end
end