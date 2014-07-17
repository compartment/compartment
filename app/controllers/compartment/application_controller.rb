module Compartment
  class ApplicationController < ActionController::Base

    before_filter :set_current_site

    def set_current_site
      if current_site.nil?
        if show_setup_wizard?
          redirect_to admin_setup_wizard_path
        else
          render 'compartment/errors/unknown_site', status: 404, layout: false
        end
      end
    end

    def current_site
      @current_site ||= Site.find_by_domain(env['SERVER_NAME']) || Site.find_by_default(true)
    end

  private

    def show_setup_wizard?
      Site.count == 0
    end

  end
end
