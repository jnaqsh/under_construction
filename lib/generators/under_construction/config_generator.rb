require_relative 'generators'

module UnderConstruction
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      desc 'Configs application controller'
      def edit_application_Controller
        if File.exist?(Rails.root + "app/controllers/application_controller.rb")
          insert_into_file "app/controllers/application_controller.rb", CONFIG_TXT, :after => "protect_from_forgery"
        else
          raise 'Couldn\'t find application_controller file'
        end
      end

      def uncomment_routes
        uncomment_lines File.expand_path('../../../../config/routes.rb', __FILE__),
                        /match "\/\*other"/
      end
    end
  end
end