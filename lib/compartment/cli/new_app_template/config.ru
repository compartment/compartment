require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require_relative 'config/application'
run Compartment::Application
