module Compartment
  class SetupWizard

    def initialize(site, user)
      @site = site
      @user = user
    end

    def save
      @site.valid? && @user.valid? && @site.save && @user.save
    end

  end
end
