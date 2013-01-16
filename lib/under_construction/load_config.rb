require 'yaml'

module UnderConstruction
  class LoadConfig
    attr_reader :configs

    def initialize
      @configs = load_config_file
    end

    def load_config_file
      YAML.load_file(File.join(Rails.root, 'config','under_construction.yml'))
    end
  end
end