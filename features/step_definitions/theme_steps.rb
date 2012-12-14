Given /^the site has a theme$/ do
  @current_site.theme = FactoryGirl.create :theme
end