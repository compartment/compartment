require_dependency "compartment/application_controller"

module Compartment
  class ThemeAssetsController < ApplicationController

    def send_asset
      file = File.join(Compartment.config.themes_path, params[:theme_name], params[:file] + '.' + params[:ext])
      send_file file
    end
    
  end
end
