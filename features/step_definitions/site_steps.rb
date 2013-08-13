Given /^there are no sites$/ do
  Compartment::Site.count.should == 0
end

Given /^a site exists$/ do
  step 'a site exists with the domain "example1.lvh.me"'
  step 'I visit the homepage'
  step 'I should not see "Site Not Found"'
end

When /^I visit the homepage$/ do
  visit '/'
end

Given /^a site exists with the domain "(.*?)"$/ do |domain|
  Capybara.app_host = "http://#{domain}"
  @current_site = FactoryGirl.create(:site, domain: domain)
end

When /^I visit the homepage using the domain "(.*?)"$/ do |domain|
  visit "http://#{domain}:#{Capybara.server_port}/"
end

Given /^the site does not have a theme$/ do
  @current_site.theme.destroy if @current_site.theme
end

Then /^I should see the site using the default theme$/ do
  page.should_not have_content('error')
end

Given /^a site exists with pages$/ do
  @current_site = FactoryGirl.create(:site)
  step 'the site has pages'
end

Given /^a site exists with pages and content$/ do
  @current_site = FactoryGirl.create(:full_site)
end