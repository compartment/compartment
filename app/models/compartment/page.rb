module Compartment
  class Page < ActiveRecord::Base
    belongs_to :site
    has_many :content_blocks

    attr_accessible :path, :title, :template
    
    validates_presence_of :path, :title, :template, :site_id
    validates_uniqueness_of :path, scope: :site_id

    def template_path
      site.theme.template_path(template)
    end
  end
end
