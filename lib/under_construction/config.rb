require 'active_support/configurable'
# TODO: rewrite this
module UnderConstruction
  def self.configure(&block)
    yield @config ||= UnderConstruction::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    include ActiveSupport::Configurable

    config_accessor :name
    config_accessor :start_date
    config_accessor :end_date
    config_accessor :logo_url
    config_accessor :socials
  end

  configure do |config|
    config.name       = 'My Cool Website'
    config.start_date = Time.now
    config.end_date   = '2 seconds from now'
    config.logo_url   = ''
    config.socials    = { twitter: 'mytwitter',
                         facebook: 'myfacebook'
                        }
  end
end