module Compartment
  class ContentArea < ActiveRecord::Base
    belongs_to :page
    attr_accessible :name
    has_many :content_blocks

    def render
      html = ''
      content_blocks.each do |content|
        html += content.render
      end
      html
    end
  end
end
