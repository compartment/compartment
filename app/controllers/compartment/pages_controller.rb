require_dependency "compartment/application_controller"

module Compartment
  class PagesController < ApplicationController

    def show
      @page = @site.pages.find_by_url_path(request.path_info)
      if @page
        render :file => @page.layout_path, layout: false
      else
        render 'compartment/errors/page_not_found', :status => 404
      end
    end
    
  end
end
