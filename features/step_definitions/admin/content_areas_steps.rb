Then(/^I should see a content area that I can add content blocks to$/) do
  all('.compartment_content_area').count.should be > 0
end

When(/^I click to add a content block to the content area$/) do
  find('.compartment_content_area_add_content').click
end

When(/^I select a type of content block$/) do
  within '.compartment_modal' do
    click_on 'Text block'
  end
end

Then(/^the content block is added$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can add another content block to the content area$/) do
  pending # express the regexp above with the code you wish you had
end
