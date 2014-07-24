ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require 'database_cleaner'
require 'ffaker'

require 'simplecov'
SimpleCov.start 'rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f }

Rails.backtrace_cleaner.remove_silencers!

FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryGirl.find_definitions

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = true

  # rspec-rails 3 will no longer automatically infer an example group's spec type from the file location. 
  config.infer_spec_type_from_file_location!
end
