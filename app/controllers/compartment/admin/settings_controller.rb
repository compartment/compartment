require_dependency "compartment/admin/application_controller"

module Compartment
  module Admin
    class SettingsController < ApplicationController

      def index
        @theme = current_site.theme
      end
      
    end
  end
end
