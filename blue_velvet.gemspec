$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blue_velvet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blue_velvet"
  s.version     = BlueVelvet::VERSION
  s.authors     = ["Tom Scott"]
  s.email       = ["tubbo@psychedeli.ca"]
  s.homepage    = "http://psychedeli.ca"
  s.summary     = "BlueVelvet is a content management system that uses the Facebook platform as a database."
  s.description = "BlueVelvet connects to a Facebook page and returns content from it in partials that can be modified by the developer."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "koala"
  s.add_development_dependency "pg"
end
