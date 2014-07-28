Then(/^I should see the setup wizard welcome page$/) do
  page.should have_content 'Welcome to Compartment!'
end

Given(/^I am viewing the setup wizard welcome page$/) do
  step 'I visit the homepage'
  step 'I should see the setup wizard welcome page'
end

When(/^I submit the setup wizard form without specifying the admin credentials$/) do
  click_on 'Create'
end

Then(/^I see the following validation messages:$/) do |table|
  table.rows.each do |row|
    page.should have_content row[0]
  end
end

When(/^I complete the setup wizard by specifying the admin user credentials$/) do
  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: 'password'
  fill_in 'Confirm Password', with: 'password'
  click_on 'Create'
end

Then(/^the default site is created$/) do
  Compartment::Site.count.should == 1
  Compartment::Site.first.default?.should be true
end

Then(/^an admin account is created$/) do
  Compartment::User.count.should == 1
end

Then(/^no pages are created$/) do
  Compartment::Page.count.should == 0
end
