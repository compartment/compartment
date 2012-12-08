module Compartment
  class Page < ActiveRecord::Base
    belongs_to :site
    attr_accessible :layout, :title, :url_path
  end
end
