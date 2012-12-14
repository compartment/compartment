Given /^the site does not have any pages$/ do
  @current_site.pages.count.should == 0
end

Given /^the site has the following page:$/ do |table|
  data = table.hashes[0]
  @current_site.pages.create!(data)
end

Then /^the page title should be "(.*?)"$/ do |title|
  find('title').should have_content(title)
end

When /^I visit a page$/ do
  visit page_url(@current_site.pages.first)
end

Then /^I should see the admin toolbar$/ do
  page.should have_content 'Admin Toolbar'
end