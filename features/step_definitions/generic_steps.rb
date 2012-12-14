Then /^I (should|should not) see "(.*?)"$/ do |should, content|
  if should == 'should'
    page.should have_content(content)
  else
    page.should_not have_content(content)
  end
end

Then /^pry$/ do
  binding.pry
end