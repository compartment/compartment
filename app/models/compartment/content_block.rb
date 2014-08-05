module Compartment
  # serves as the base class to all types of content blocks
  class ContentBlock < ActiveRecord::Base
    belongs_to :page
    
    attr_accessible :content_area, :data

    validates_presence_of :content_area

    def self.inherited(base)
      Compartment.registered_content_blocks << base
    end

    def self.content_block_name(name = nil)
      @content_block_name = name if name
      @content_block_name
    end

    def self.content_block_description(desc = nil)
      @content_block_description = desc if desc
      @content_block_description
    end

    def self.metadata
      {
        class: self.to_s,
        name: content_block_name,
        description: content_block_description,
      }
    end

    # this is called when rendering the content for non-admins
    def render
      data
    end

  end
end
