Given(/^I am viewing the pages index$/) do
  visit compartment.admin_pages_path
end

Given(/^I have already created some pages$/) do
  FactoryGirl.create(:page, title: 'First Page',  path: '/first',  site: @site)
  FactoryGirl.create(:page, title: 'Second Page', path: '/second', site: @site)
end

Given(/^I am viewing a new page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have created a page that is not yet published$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the pages admin$/) do
  click_on 'Pages'
end

When(/^I click to create a new page$/) do
  click_on 'New Page'
end

Then(/^I specify the title$/) do
  fill_in 'Title', with: 'My new page title'
end

When(/^I specify the path$/) do
  fill_in 'Path', with: '/my-new-page'
end

Then(/^I specify the template$/) do
  choose 'One Column'
end

When(/^I save the page$/) do
  click_on 'Create Page'
end

When(/^I click to publish the page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the list of pages that have been created$/) do
  page.should have_content 'First Page'
  page.should have_content 'Second Page'
end

Then(/^the page is created$/) do
  pending
end

Then(/^I am taken to the page so I can edit it$/) do
  current_path.should == Compartment::Page.last.path
end

Then(/^I see the admin toolbar$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the page status is displayed as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see content areas where I can add content blocks$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the page should be visible when I log out$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the (\d+) page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

