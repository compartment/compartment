Given /^there are no sites$/ do
  Compartment::Site.count.should == 0
end

Given(/^the default site exists$/) do
  @site = Compartment::Site.create!(default: true)
  Compartment::Site.count.should be > 0
end

# Given /^a site exists$/ do
#   # step 'a site exists with the domain "example1.lvh.me"'
#   # step 'I visit the homepage'
#   # step 'I should not see "Site Not Found"'
# end

Given(/^another site exists with a specific domain$/) do
  @domain = 'example2.lvh.me'
  @site = Compartment::Site.create!(domain: @domain)
end

Given /^a site exists with the domain "(.*?)"$/ do |domain|
  @current_site = FactoryGirl.create(:site, domain: domain)
end

Given /^a site exists with pages$/ do
  @current_site = FactoryGirl.create(:site)
  step 'the site has pages'
end

Given /^a site exists with pages and content$/ do
  @current_site = FactoryGirl.create(:full_site)
end