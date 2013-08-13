require_dependency "compartment/application_controller"

module Compartment
  class PagesController < ApplicationController

    def show
      @page = current_site.pages.find_by_url_path(request.path_info)
      if @page
        render :file => @page.template_path, layout: false
      else
        # render 'compartment/errors/page_not_found', :status => 404
        render file: current_site.theme.path_to_template(:page_not_found), status: 404, layout: false
      end
    end
    
  end
end
