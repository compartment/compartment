namespace :compartment do

  task :install do
    # TODO: copy the themes directory into the rails app's app directory
  end

  desc "Seeds the database with a fully functioning demo site"
  task :demo => :environment do
    # create site
    site = Compartment::Site.create!(:domain => 'localhost')
    site.create_theme(:name => 'default')

    #create users
    site.users.create!(:email => 'demo', :password => 'demo')
    
    # create content
    page = site.pages.create!(:url_path => '/', :title => 'Homepage', :template => 'one_column')
    page.content_blocks.create!(content_area: 'body', :data => 'welcome to the homepage')
  end

end
