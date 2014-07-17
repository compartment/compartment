Given(/^the site has a homepage$/) do
  @page = FactoryGirl.create(:page_with_content, site: @site)
  @page.content_blocks.first.update_attributes(data: "#{@site.domain} homepage content")
end

Given(/^both sites have a homepage$/) do
  Compartment::Site.count.should == 2
  Compartment::Site.all.each do |site|
    @site = site
    step 'the site has a homepage'
  end
end

Given(/^a random page exists$/) do
  @site.should_not be_nil
  @path = '/this-page-is-not-so-random'
  @page = FactoryGirl.create(:page_with_content, path: @path, site: @site)
  @page_content = 'my random page'
  @page.content_blocks.first.update_attributes(data: @page_content)
end

When /^I visit the homepage$/ do
  visit '/'
end

When(/^I visit the homepage without specifying a domain$/) do
  Capybara.app_host = nil
  step 'I visit the homepage'
end

When(/^I visit the homepage while specifying the domain of the other site$/) do
  Capybara.app_host = "http://#{@domain}"
  visit "http://#{@domain}:#{Capybara.server_port}/"
end

When(/^I visit the page$/) do
  visit @page.path
end

When(/^I visit a random page$/) do
  visit '/this-page-is-so-random'
end

Then(/^I am redirected to the homepage$/) do
  current_path.should == '/'
  step 'I visit the homepage'
end

# Given(/^the default site has a homepage$/) do
#   @site = Compartment::Site.where(default: true).first
#   @site.should_not be_nil
#   step 'the site has a homepage'
# end


# Then(/^I should see the default site's homepage$/) do
#   page.should_not have_content 'Page not found'
#   page.should have_content 'homepage content'
# end

Then(/^I should see the site's homepage$/) do
  page.should_not have_content 'Page not found'
  page.should have_content "#{@site.domain} homepage content"
end

Then(/^I should see the default site's homepage$/) do
  @site = Compartment::Site.where(default: true).first
  step "I should see the site's homepage"
end

Then(/^I should see the homepage of the other site$/) do
  @site = Compartment::Site.where(default: false).first
  step "I should see the site's homepage"
end

Then(/^I should see the custom 404 page defined by the site's theme$/) do
  page.should have_content 'Page not found'
end

Then(/^I should see the page$/) do
  current_path.should == @page.path
  page.should_not have_content 'Page not found'
  @page_content.should_not be_blank
  page.should have_content @page_content
end
