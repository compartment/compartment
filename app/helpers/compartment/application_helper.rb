module Compartment
  module ApplicationHelper

    def admin_logged_in?
      session[:user_id].present?
    end

    # def current_page
    #   @page
    # end
  end
end
