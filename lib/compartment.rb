%w{
  jquery-rails
  backbone-on-rails
  bootstrap-sass
  compartment/config
  compartment/engine
}.each { |dependency| require dependency }
require_relative '../app/models/compartment/content_block'

module Compartment
  def self.config
    @config ||= Config.new
  end

  def self.logger
    config.logger
  end

  def self.registered_themes
    @registered_themes ||= {}
  end

  def self.registered_content_blocks
    @registered_content_blocks ||= []
  end
end
