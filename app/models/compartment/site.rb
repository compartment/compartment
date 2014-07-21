module Compartment
  class Site < ActiveRecord::Base
    has_many :pages
    has_many :users
    attr_accessible :domain
    attr_accessible :default

    validates_uniqueness_of :domain

    def theme
      Theme.find_by_name(read_attribute(:theme)) || Theme.default
    end

  end
end
