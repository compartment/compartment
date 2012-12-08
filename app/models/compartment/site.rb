module Compartment
  class Site < ActiveRecord::Base
    attr_accessible :domain
    validates_uniqueness_of :domain
    has_many :pages
  end
end
