require_dependency "compartment/admin/application_controller"

module Compartment
  module Admin
    class ThemesController < ApplicationController

      def index
        @themes = Compartment.registered_themes
    
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @themes }
        end
      end

    end
  end
end
