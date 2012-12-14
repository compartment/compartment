$:.push File.expand_path("../lib", __FILE__)

require "compartment/version"

Gem::Specification.new do |s|
  s.name        = "compartment"
  s.version     = Compartment::VERSION
  s.authors     = ["Andrew Havens"]
  s.email       = ["email@andrewhavens.com"]
  s.homepage    = "TODO"
  s.summary     = "Ruby CMS"
  s.description = "Ruby CMS"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"
  # s.add_development_dependency "sqlite3"
  # s.add_development_dependency "rspec-rails"
  # s.add_development_dependency "shoulda-matchers", "~>1.0"#, "~> 3.0"
  # s.add_development_dependency "factory_girl_rails"
  # s.add_development_dependency "database_cleaner"
end
