module Compartment
  class ApplicationController < ActionController::Base

    attr_accessor :current_site

    before_filter :find_site_by_domain

    def find_site_by_domain
      @site = Site.find_by_domain(request.domain)
      unless @site
        render 'compartment/errors/unknown_site', :status => 404
      end
    end
  end
end
