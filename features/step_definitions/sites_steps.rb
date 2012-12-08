Given /^there are no sites in the database$/ do
  Compartment::Site.count.should == 0
end

When /^I visit the homepage$/ do
  visit root_url
end

Given /^a site exists with the domain "(.*?)"$/ do |domain|
  Compartment::Site.create!(domain: domain)
end

When /^I visit the homepage using the domain "(.*?)"$/ do |domain|
  Capybara.default_host = "example.com"
  visit root_url
end

Then /^I (should|should not) see "(.*?)"$/ do |should, content|
  if should == 'should'
    page.should have_content(content)
  else
    page.should have_content(content)
  end
end