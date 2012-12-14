require "compartment/engine"
require "compartment/config"

module Compartment
  def self.config
    @config ||= Config.new
  end
end
