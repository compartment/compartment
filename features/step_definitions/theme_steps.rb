Given /^the site does not have a theme$/ do
  @site.theme.should == Compartment::Theme.default
end

Given /^the site has a theme$/ do
  @site.should_not be_nil
  @site.theme.should_not be_nil # should have defaulted to the default theme
end

Given(/^the site has specified a custom theme$/) do
  @site.theme = 'Custom Theme'
end

Then(/^I should see the default theme$/) do
  page.should have_content 'Spring Bloom' # FIXME: need to add some sort of unique identifier to the default theme
end

Then /^I should see the site using the default theme$/ do
  page.should_not have_content('error')
end

Then(/^I should see the custom theme$/) do
  page.should have_content('custom test theme')
end
