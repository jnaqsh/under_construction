module UnderConstruction
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
      g.assets false
      g.helper false
    end
  end
end
