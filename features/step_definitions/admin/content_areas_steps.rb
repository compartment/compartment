Then(/^I should see a content area that I can add content blocks to$/) do
  all('.compartment_content_area').count.should be > 0
  all('.compartment_content_block').count.should == 0
  # TODO: find a way to keep track of the content area so we can DRY this up
  # @content_area = find('.compartment_content_area_add_content').closest('.content_area')
  # @content_area = all('.compartment_content_area').last()
  # @content_area.all('.compartment_content_block').count.should == 0
end

When(/^I click to add a content block to the content area$/) do
  # @content_area.find('.compartment_content_area_add_content').click
  # within @content_area do
    find('.compartment_content_area_add_content').click
  # end
end

When(/^I select a type of content block$/) do
  within '.compartment_modal' do
    click_on 'Text block'
  end
end

Then(/^the content block is added$/) do
  # @content_area.all('.compartment_content_block').count.should == 1
  # within @content_area do
  #   all('.compartment_content_block').count.should == 1
  # end
  all('.compartment_content_block').count.should == 1
end

Then(/^I can add another content block to the content area$/) do
  step 'I click to add a content block to the content area'
  step 'I select a type of content block'
  # @content_area.all('.compartment_content_block').count.should == 2
  all('.compartment_content_block').count.should == 2
end
