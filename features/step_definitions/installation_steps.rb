Given(/^I have installed the Compartment gem$/) do
  puts 'already installed?'
end

When(/^I type 'compartment' from the command line$/) do
  step 'I run `compartment`'
end

Then(/^I should see the help documentation$/) do
  step %{the output should contain "Commands:\n  compartment help"}
end

Then(/^a new compartment app directory should be created$/) do
  step 'a directory named "WebsiteName" should exist'
end

Given(/^I have created a Compartment app directory$/) do
  step 'I run `compartment new WebsiteName`'
end

When(/^I run 'rackup' from the app directory$/) do
  puts 'TODO: need to figure out how to simulate rackup or validate config.ru'
  # step 'I cd to "WebsiteName"'
  # step 'I run `rackup`'

  # TODO: load the config.ru file
  # Capybara.app = Rack::Builder.new do
  #   map "/" do
  #     run Rails.application
  #   end
  # end.to_app
end
