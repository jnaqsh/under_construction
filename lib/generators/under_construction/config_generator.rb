require_relative 'generators'

module UnderConstruction
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc 'Configs application controller'
      def edit_application_Controller
        if File.exist?(Rails.root + "app/controllers/application_controller.rb")
          insert_into_file "app/controllers/application_controller.rb", CONFIG_TXT, :after => "protect_from_forgery"
        else
          raise 'Couldn\'t find application_controller file'
        end
      end

      def uncomment_underconstruction_routes
        uncomment_lines File.expand_path('../../../../config/routes.rb', __FILE__),
                        /match "\/\*other"/
      end

      def comment_redirect_route
        
      end

      def copy_config_file
        copy_file 'under_construction.yml', Rails.root + 'config/under_construction.yml'
      end
    end
  end
end