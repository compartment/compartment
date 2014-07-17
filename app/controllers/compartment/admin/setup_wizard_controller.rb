module Compartment
  module Admin
    class SetupWizardController < ActionController::Base

      def new
        @site = Compartment::Site.new
        @user = Compartment::User.new
      end
    
      def create
        @site = Compartment::Site.new(params[:site])
        @site.default = true
        @user = Compartment::User.new(params[:user])
        wizard = Compartment::SetupWizard.new(@site, @user)
        if wizard.save
          redirect_to root_path
        else
          @errors = @site.errors.full_messages + @user.errors.full_messages
          render action: 'new'
        end
      end

    end
  end
end
