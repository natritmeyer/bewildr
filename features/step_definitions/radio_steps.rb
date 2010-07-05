Given /^I select the radio tab$/ do
  @main_window.get(:id => "main_tabs").select("checks/radio") if @main_window.get(:id => "main_tabs").selected.name != "checks/radio"
end

Then /^the third radio button is unselected$/ do
  @main_window.get(:id => "radioButton3").should_not be_selected
end

When /^I select the first radio button$/ do
  @main_window.get(:id => "radioButton1").select
end

Then /^the first radio button is selected$/ do
  @main_window.get(:id => "radioButton1").should be_selected
end

When /^I select the second radio button using click$/ do
  @main_window.get(:id => "radioButton2").click
end

Then /^the second radio button is selected$/ do
  @main_window.get(:id => "radioButton2").should be_selected
end

When /^I loop through each radio button, clicking each one$/ do
  @main_window.get(:id => "tab_checks_radio").get(:type => :radio_button, :how_many => :all).each do |radio|
    radio.should_not be_selected
    radio.select
    radio.should be_selected
  end
end

Then /^the third radio button is selected$/ do
  @main_window.get(:id => "radioButton3").should be_selected
end
