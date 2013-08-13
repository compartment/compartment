# content area steps

Then /^I should see a content area$/ do
  find '.compartment_content_area'
end

Then /^I should see an "(.*?)" button within the content area$/ do |button|
  find_button(button)
end

When /^I click the "(.*?)" button within the content area$/ do |button|
  within '.compartment_content_area:first-of-type' do
    click_button(button)
  end
end

# content block steps

Then /^I should be able to choose different types of content blocks$/ do
  page.should have_content 'HTML block'
end

Then /^I should see a content block$/ do
  all('.compartment_content_block').count.should > 0
end

Then /^I should see an? "(.*?)" button when I hover over a content block$/ do |button|
  page.execute_script('$(".compartment_content_block:first-of-type").trigger("mouseenter")')
  within '.compartment_content_block:first-of-type' do
    find_button(button)
  end
end

When /^I click "(.*?)" on a content block$/ do |button|
  page.execute_script('$(".compartment_content_block:first-of-type").trigger("mouseenter")')
  within '.compartment_content_block:first-of-type' do
    click_button(button)
  end
end

Then /^I should be able to change the content$/ do
  @new_content = 'new content'
  within '.compartment_content_block:first-of-type' do
    find('textarea').set @new_content
    click_button 'Save'
  end
end

Then /^the new content should be displayed$/ do
  page.should have_content @new_content
end

Then /^I should see that I can add a content block to a content area$/ do
  within '.compartment_content_area' do
    page.should have_button 'Add Content'
  end
end