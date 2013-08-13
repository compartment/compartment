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

Then /^sleep (.+)$/ do |seconds|
  sleep seconds.to_i
end

Then /^I should see a modal$/ do
  find('.modal')
end