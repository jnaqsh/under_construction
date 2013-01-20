require 'rails'
require 'rufus-scheduler'
require 'chronic'

require "under_construction/engine"
require "under_construction/config"

module UnderConstruction
  autoload :Schedule,       "under_construction/schedule"
end
