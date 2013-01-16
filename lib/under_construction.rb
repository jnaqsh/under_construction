require 'rufus-scheduler'
require 'chronic'

module UnderConstruction
  autoload :Schedule, "under_construction/schedule"
end

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

require "under_construction/config"
require "under_construction/load_config"
require "under_construction/engine"