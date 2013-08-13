module Compartment
  class Page < ActiveRecord::Base
    belongs_to :site
    has_many :content_blocks

    attr_accessible :template, :title, :url_path
    
    validates_uniqueness_of :url_path

    def template_path
      site.theme.path_to_template(template)
    end
  end
end
