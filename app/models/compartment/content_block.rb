module Compartment
  class ContentBlock < ActiveRecord::Base
    belongs_to :page
    
    attr_accessible :content_area, :data

    validates_presence_of :content_area

    def render
      data
    end

  end
end
