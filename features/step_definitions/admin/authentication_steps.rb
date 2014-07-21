Given /^I am signed in as an admin$/ do
  step 'I have an admin user account'
  step 'I visit the sign in page'
  step 'I fill out the sign in form using valid credentials'
end

Given /^I am signed in$/ do
  step 'I am signed in as an admin'
end

Given /^I have an admin user account$/ do
  @email = 'user@example.com'
  @password = 'password'
  @user = FactoryGirl.create(:user, email: @email, password: @password, site: @site)
end

Given(/^I am viewing the sign in page$/) do
  step 'I visit the sign in page'
end

When /^I visit the sign in page$/ do
  visit compartment.admin_login_path
end

When(/^I fill out the sign in form using invalid credentials$/) do
  fill_in :email, with: 'bad@example.com'
  fill_in :password, with: 'badpassword'
  click_button 'Sign in'
end

When(/^I fill out the sign in form using valid credentials$/) do
  fill_in :email, with: @email
  fill_in :password, with: @password
  click_button 'Sign in'
end

Then(/^I should see an error message that my credentials were incorrect$/) do
  within '.alert' do
    page.should have_content 'Invalid email or password'
  end
end

Then(/^I should be redirected to the sign in page$/) do
  page.current_path.should == admin_login_path
end

Then /^I should be redirected to the admin dashboard$/ do
  page.current_path.should == admin_dashboard_path
  step 'I should see "Dashboard"'
end
