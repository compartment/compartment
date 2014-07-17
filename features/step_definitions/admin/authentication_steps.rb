Given /^I am logged in$/ do
  step 'I have a user account'
  step 'I visit the login page'
  step 'I fill out the login form'
end

Given /^I have a user account$/ do
  @email = 'user@example.com'
  @password = 'password'
  @current_user = FactoryGirl.create(:user, email: @email, password: @password, site: @current_site)
end

Given /^I have the following user:$/ do |table|
  @email, @password = table.hashes[0][:email], table.hashes[0][:password]
  @current_user = FactoryGirl.create(:user, email: @email, password: @password, site: @current_site)
end

When /^I visit the login page$/ do
  visit admin_login_path
end

When /^I fill out the login form$/ do
  step "I fill out the login form with \"#{@email}\" and \"#{@password}\""
end

Then /^I should see the error "(.*?)"$/ do |error|
  page.should have_content error
end

Then /^I should be redirected to the admin dashboard$/ do
  page.current_path.should == admin_dashboard_path
  step 'I should see "Dashboard"'
end

When /^I fill out the login form with "(.*?)" and "(.*?)"$/ do |email, password|
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
