require 'active_support/configurable'
require 'yaml'

module UnderConstruction
  def self.configure(&block)
    yield @config ||= UnderConstruction::Configuration.new
  end

  def self.config
    @config
  end

  def self.config_file
    config_path = File.join(Rails.root, 'config','under_construction.yml')
    if File.exist? File.join(Rails.root, 'config','under_construction.yml')
      YAML.load_file(config_path)
    else
      false
    end
  end

  class Configuration
    include ActiveSupport::Configurable

    config_accessor :theme
    config_accessor :launch_time
    config_accessor :progress
    config_accessor :progress_label
    config_accessor :info
    config_accessor :site_developer
    config_accessor :socials_title
    config_accessor :socials
    config_accessor :notify_mail
    config_accessor :website_address
  end

  if config_file
    configure do |configuration|
      config_file.each_pair do |key, value|
        configuration.config[key.to_sym] = value
      end
    end
  end

end
