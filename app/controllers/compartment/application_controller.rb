module Compartment
  class ApplicationController < ActionController::Base

    attr_accessor :current_site

    before_filter :find_site_by_domain

    def find_site_by_domain
      @current_site ||= Site.find_by_domain(env['SERVER_NAME'])
      unless @current_site
        render 'compartment/errors/unknown_site', status: 404, layout: false
      end
    end

  end
end
