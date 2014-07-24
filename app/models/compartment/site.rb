module Compartment
  class Site < ActiveRecord::Base
    has_many :pages
    has_many :users
    attr_accessible :domain, :default, :theme

    validates_uniqueness_of :domain
    validate :valid_theme?

    def theme
      Theme.find_by_name(read_attribute(:theme)) || Theme.default
    end

    def valid_theme?
      unless read_attribute(:theme).blank? or Compartment.registered_themes.has_key?(read_attribute(:theme))
        errors.add :base, 'Invalid theme identifier'
      end
    end

  end
end
