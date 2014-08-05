module Compartment
  class Engine < ::Rails::Engine
    isolate_namespace Compartment

    # initializer "Compartment.configure_paths" do |app|
    #   Compartment.config.themes_path = File.join(app.root, 'app', 'themes')
    #   Compartment.config.user_defined_content_blocks_path = File.join(app.root, 'app', 'content_blocks')
    # end

    # initializer "Compartment.load_user_defined_content_blocks" do |app|
    #   Compartment.config.load_user_defined_content_blocks
    # end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
