Given /^the site has pages$/ do
  FactoryGirl.create(:page, site: @current_site)
end

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
  url = @current_site.pages.first.url_path
  raise 'Page needs a url_path' if url.nil?
  visit @current_site.pages.first.url_path
end

Then /^I should see the admin toolbar$/ do
  find('#compartment_toolbar_iframe')
end