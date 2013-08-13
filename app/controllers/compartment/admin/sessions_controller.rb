require_dependency "compartment/application_controller"

module Compartment
  module Admin
    class SessionsController < Compartment::ApplicationController
      
      layout 'compartment/authentication'

      def new
      end
    
      def create
        if params[:email].empty? or params[:password].empty?
          flash.now.alert = "Invalid email or password"
          return render "new"
        end

        user = current_site.users.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to admin_dashboard_url, :notice => "Logged in!"
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end
      end

      def destroy
        session[:user_id] = nil
        redirect_to root_url, :notice => "Logged out!"
      end
    end
  end
end
