ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../../spec/dummy/config/environment.rb",  __FILE__)
ENV["RAILS_ROOT"] ||= File.dirname(__FILE__) + "../../../spec/dummy"

require 'cucumber/rails'
require 'capybara-webkit'
require 'aruba/cucumber'
require 'ffaker'

Capybara.default_selector = :css
Capybara.javascript_driver = :webkit # headless
Before '@selenium' do
  Capybara.current_driver = :selenium
end

After do
  Capybara.app_host = nil # make sure app_host is reset
end

ActionController::Base.allow_rescue = false

# DatabaseCleaner.strategy = :transaction # for SQL
DatabaseCleaner.strategy = :truncation # for MongoDB/CouchDB/etc

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), '..', '..', 'spec', 'factories')
FactoryGirl.find_definitions

module EngineRoutesHelper
  include Compartment::Engine.routes.url_helpers
end
World(EngineRoutesHelper)
