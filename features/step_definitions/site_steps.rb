Given /^there are no sites$/ do
  Compartment::Site.count.should == 0
end

When /^I visit the homepage$/ do
  visit root_url
end

Given /^a site exists with the domain "(.*?)"$/ do |domain|
  @current_site = FactoryGirl.create(:site, domain: domain)
end

When /^I visit the homepage using the domain "(.*?)"$/ do |domain|
  visit "http://#{domain}/"
end

Given /^a site exists$/ do
  step 'a site exists with the domain "example.com"'
end

Given /^the site does not have a theme$/ do
  @current_site.theme.destroy if @current_site.theme
end

Then /^I should see the site using the default theme$/ do
  page.should_not have_content('error')
end

Given /^a site exists with pages and content$/ do
  @current_site = FactoryGirl.create(:full_site)
end