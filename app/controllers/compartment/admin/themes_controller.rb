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

      def update
        respond_to do |format|
          if current_site.update_attributes(theme: params[:id])
            format.html { redirect_to action: 'index', notice: 'Site theme has been updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'index' }
            format.json { render json: @page.errors, status: :unprocessable_entity }
          end
        end
      end

    end
  end
end
