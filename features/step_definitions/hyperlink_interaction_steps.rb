When /^I click on the Link Text link$/ do
  @main_window.get(:type => :hyperlink).first.click
end

Then /^the label is displays Link label clicked$/ do
   @main_window.get(:id => "result").text.should match("Link label clicked")
end

Then /^the text of the first link is Link Text$/ do
  @main_window.get(:type => :hyperlink).first.text.should match("Link Text")
end