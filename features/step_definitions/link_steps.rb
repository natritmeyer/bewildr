Given /^I select the link tab$/ do
  @main_window.get(:id => "main_tabs").select("text fields") if @main_window.get(:id => "main_tabs").selected.name != "text fields"
end

When /^I click the link$/ do
  @main_window.get(:id => "a_link").click
end

Then /^the link result message displays the success message$/ do
  @main_window.get(:id => "link_clicked_label").text.should match("link clicked!")
end

Then /^the link text is Label$/ do
  @main_window.get(:id => "a_link").text.should match("Label")
end