When /^I select One from the right hand list$/ do
  @main_window.get(:id => "listBoxWithDynamicItems").select("One")
end

Then /^the selected item in the right hand list is One$/ do
  @main_window.get(:id => "listBoxWithDynamicItems").selected.name.should match("One")
end