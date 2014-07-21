module Compartment
  class Config
    attr_accessor :themes_path,
                  :content_blocks_path
    def logger
      @logger ||= Rails.logger
    end

    def content_block_types
      @content_block_types ||= []
    end

    def load_content_block_types
      Dir[content_blocks_path + '/*/*.rb'].each do |item|
        require item
      end
    end
    
  end
end