$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "under_construction/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "under_construction"
  s.version     = UnderConstruction::VERSION
  s.authors     = ["Arash Mousavi"]
  s.email       = ["mousavi.arash@gmail.com"]
  s.homepage    = "https://github.com/jnaqsh/under_construction"
  s.summary     = "A rails GEM to automaticaly moderate underconstruction 
                    pages with ability to automatically schedule for launch time"
  s.description = "A rails GEM to automaticaly moderate underconstruction 
                    pages with ability to automatically schedule for launch time"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "rufus-scheduler", "~> 2.0"
  s.add_dependency "chronic", "~> 0.9"

  # Devlopment
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "ammeter"
end
