Given(/^I am viewing the admin dashboard$/) do
  step 'I visit the admin dashboard'
end

When(/^I visit the admin dashboard$/) do
  visit compartment.admin_dashboard_path
end