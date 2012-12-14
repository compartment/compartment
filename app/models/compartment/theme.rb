module Compartment
  class Theme < ActiveRecord::Base
    belongs_to :site
    attr_accessible :name

    def path
      File.join(Compartment.config.themes_path, name)
    end

    def self.default
      Theme.new(:name => 'default')
    end
  end
end
