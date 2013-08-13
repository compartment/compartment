require_dependency "compartment/admin/application_controller"

module Compartment
  module Admin
    class ContentBlocksController < ApplicationController

      respond_to :json

      def index
        @content_blocks = current_page.content_blocks.all
        respond_with @content_blocks
      end
    
      def show
        @content_block = current_page.content_blocks.find(params[:id])
        respond_with @content_block
      end
    
      def new
        @content_block = current_page.content_blocks.build
        respond_with @content_block
      end
    
      def edit
        @content_block = current_page.content_blocks.find(params[:id])
        respond_with @content_block
      end
    
      def create
        @content_block = current_page.content_blocks.build(params[:content_block])
        @content_block.save
        respond_with @content_block, location: admin_page_content_block_url(current_page, @content_block)
      end
    
      def update
        @content_block = current_page.content_blocks.find(params[:id])
        @content_block.update_attributes(params[:content_block])
        respond_with @content_block
      end
    
      def destroy
        if @content_block = content_block
          @content_block.destroy
          respond_with @content_block
        else
          respond_with nil, status: 404
        end
      end

      # TODO: move this to its own controller
      # used for displaying the available content block types
      # def available
      #   @content_block_types = Compartment.config.content_block_types
      #   respond_with @content_block_types
      # end

    private

      def content_block
        content_block = ContentBlock.find(params[:id])
        if content_block.page.site.id == current_site.id
          content_block
        end
      end

    end
  end
end
