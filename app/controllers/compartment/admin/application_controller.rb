require_dependency "compartment/application_controller"

module Compartment
  module Admin
    class ApplicationController < Compartment::ApplicationController

      before_filter :require_logged_in_user

      def current_page
        current_site.pages.find(params[:page_id]) if params[:page_id]
      end
      
      private

      def require_logged_in_user
        redirect_to admin_login_url unless current_user
      end

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user


    end
  end
end
