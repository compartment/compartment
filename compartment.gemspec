$:.push File.expand_path("../lib", __FILE__)

require "compartment/version"

Gem::Specification.new do |s|
  s.name        = "compartment"
  s.version     = Compartment::VERSION
  s.authors     = ["Andrew Havens"]
  s.email       = ["email@andrewhavens.com"]
  s.homepage    = "https://compartment.github.io"
  s.summary     = "Coming Soon"
  s.description = "Coming Soon"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "bcrypt-ruby", "~> 3.0.0"
  s.add_dependency "jquery-rails", "~> 2.1.4"
  s.add_dependency "backbone-on-rails", "~> 1.0.0.0"
  s.add_dependency "bootstrap-sass", "~> 2.2.2.0"
  s.add_dependency "sass-rails", '~> 3.2.0'
  s.add_dependency "bourbon"
  s.add_dependency "neat"
end
