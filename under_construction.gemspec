$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "under_construction/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "under_construction"
  s.version     = UnderConstruction::VERSION
  s.authors     = ["Arash Mousavi", "Hamed Ramezanian"]
  s.email       = ["mousavi.arash@gmail.com", "h.ramezanian@jnaqsh.com"]
  s.homepage    = "https://github.com/jnaqsh/under_construction"
  s.summary     = "A rails GEM to automaticaly moderate under construction
                    pages with ability to automatically schedule for launch time"
  s.description = "A rails GEM to automaticaly moderate under construction
                    pages with ability to automatically schedule for launch time.
                    Also it have two default themes and some other fancy things."

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "rufus-scheduler", "~> 2.0"
  s.add_dependency "chronic", "~> 0.9"

  # Devlopment
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", '2.14.2'
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-inotify"
  s.add_development_dependency "capybara"
  s.add_development_dependency "ammeter"
  s.add_development_dependency "pry", ['~> 0.9']
  s.add_development_dependency "pry-debugger", ['0.2.2']
end
