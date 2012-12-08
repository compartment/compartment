require_dependency "compartment/application_controller"

module Compartment
  class PagesController < ApplicationController

    def show
      @page = @current_site.pages.find_by_url_path(params[:url_path])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
    
  end
end
