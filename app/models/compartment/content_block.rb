module Compartment
  class ContentBlock < ActiveRecord::Base
    belongs_to :content_area
    attr_accessible :data

    def render
      data
    end
  end
end
