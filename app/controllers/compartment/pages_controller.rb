require_dependency "compartment/application_controller"

module Compartment
  class PagesController < ApplicationController

    def show
      @page = current_site.pages.find_by_path(request.path_info)
      if @page
        render :file => @page.template_path, layout: false
      else
        render file: current_site.theme.template_path(:page_not_found), status: 404, layout: false
      end
    end
    
  end
end
