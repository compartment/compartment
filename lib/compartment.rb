%w{
  jquery-rails
  backbone-on-rails
  bootstrap-sass
  compartment/config
  compartment/engine
}.each { |dependency| require dependency }

module Compartment
  def self.config
    @config ||= Config.new
  end
end
