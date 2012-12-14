Given /^I am logged in$/ do
  step 'I have a user account'
  step 'I visit the login page'
  step 'fill out the login form'
end

When /^I visit the login page$/ do
  visit login_url
end

When /^fill out the login form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the error "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I have a user account$/ do
  @current_user = FactoryGirl.create(:user)
end

Then /^I should be redirected to the admin dashboard$/ do
  page.current_url.should == admin_dashboard_url
end