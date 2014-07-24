Given(/^I am viewing the theme administration page$/) do
  step 'I visit the theme administration page'
end

When(/^I visit the theme administration page$/) do
  visit compartment.admin_themes_path
end

When(/^I select a different theme$/) do
  step 'I see that my current theme is the default theme'
  click_on 'Custom Test Theme'
  within '.selected' do
    page.should_not have_content 'Compartment Default'
    page.should have_content 'Custom Test Theme'
  end
end

Then(/^I see a list of themes$/) do
  Compartment.registered_themes.count.should == 2
  Compartment.registered_themes['Compartment Default'].should_not be_nil
  Compartment.registered_themes['Custom Test Theme'].should_not be_nil
  page.should have_content 'Compartment Default'
  page.should have_content 'Custom Test Theme'
end

Then(/^I see that my current theme is the default theme$/) do
  within '.selected' do
    page.should have_content 'Compartment Default'
    page.should_not have_content 'Custom Test Theme'
  end
end

Then(/^I should see the theme that I selected$/) do
  page.should have_content 'Custom Test Theme'
end
