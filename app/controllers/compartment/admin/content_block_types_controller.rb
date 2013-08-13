require_dependency "compartment/admin/application_controller"

module Compartment
  module Admin
    class ContentBlockTypesController < ApplicationController

      def index
        @content_block_types = Compartment.config.content_block_types
        render json: @content_block_types
      end

    end
  end
end
