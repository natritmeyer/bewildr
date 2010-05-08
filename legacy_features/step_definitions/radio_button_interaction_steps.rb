Then /^neither radio button is selected$/ do
  @main_window.get(:id => "radioButton1").should be_unselected
  @main_window.get(:id => "radioButton2").should be_unselected
end

When /^I select the (foo|bar) radio$/ do |radio|
  case radio
  when "foo" then @main_window.get(:id => "radioButton1").select
  when "bar" then @main_window.get(:id => "radioButton2").select
  end
end

Then /^the (foo|bar) radio is selected$/ do |radio|
  case radio
  when "foo" then @main_window.get(:id => "radioButton1").should be_selected
  when "bar" then @main_window.get(:id => "radioButton2").should be_selected
  end
end

Then /^the (foo|bar) radio is unselected$/ do |radio|
  case radio
  when "foo" then @main_window.get(:id => "radioButton1").should be_unselected
  when "bar" then @main_window.get(:id => "radioButton2").should be_unselected
  end
end