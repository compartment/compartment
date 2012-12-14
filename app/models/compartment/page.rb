module Compartment
  class Page < ActiveRecord::Base
    belongs_to :site
    attr_accessible :layout, :title, :url_path
    validates_uniqueness_of :url_path
    has_many :content_areas

    def layout_path
      File.join(site.theme.path, layout)
    end
  end
end
