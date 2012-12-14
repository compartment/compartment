Then /^I should see an "(.*?)" button when I hover over a content block$/ do |button|
  within '.compartment_content_block:first-of-type' do
    hover
    find button
  end
end

When /^I click "(.*?)" on a content block$/ do |button|
  within '.compartment_content_block:first-of-type' do
    hover
    click button
  end
end

Then /^I should be able to change the content$/ do
  find '[name=data]'
  @new_content = 'new content'
  fill_out :data, with: @new_content
end

Then /^the new content should be displayed$/ do
  page.should have_content @new_content
end

Then /^I should see that I can add a content block to a content area$/ do
  within '.compartment_content_area' do
    page.should have_button 'Add Content'
  end
end