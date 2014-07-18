Then /^I (should|should not) see "(.*?)"$/ do |should, content|
  if should == 'should'
    page.should have_content(content)
  else
    page.should_not have_content(content)
  end
end

Then /^(I )pry$/ do |i|
  binding.pry
end

Then /^(I )sleep (\d+)$/ do |i, seconds|
  sleep seconds.to_i
end

Then /^I should see a modal$/ do
  find('.modal')
end