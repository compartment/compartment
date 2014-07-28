require_dependency "compartment/application_controller"

module Compartment
  class ThemeAssetsController < ApplicationController

    def send_asset
      # file = File.join(Compartment.config.themes_path, params[:theme_name], params[:file] + '.' + params[:ext])
      file = current_site.theme.asset_filepath(params[:file] + '.' + params[:ext])
      if File.exist?(file)
        send_file file
      else
        status 404
      end
    end
    
  end
end
