require 'rails'
require 'rufus-scheduler'
require 'chronic'

require "under_construction/engine"

module UnderConstruction

  class Railtie < ::Rails::Railtie
    initializer "set_autoload_paths" do |app|
      if app.config.autoload_paths
        require "under_construction/config"
        require "under_construction/schedule"
      end
    end
  end

end
