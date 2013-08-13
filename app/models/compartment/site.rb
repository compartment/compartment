module Compartment
  class Site < ActiveRecord::Base
    has_many :pages
    has_many :users
    has_one :theme
    attr_accessible :domain
    validates_uniqueness_of :domain

    def theme
      @theme || Theme.default
    end

  end
end
