require_relative 'constants'

module UnderConstruction
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc 'Configs application controller'
      def edit_application_Controller
        if File.exist?(Rails.root + "app/controllers/application_controller.rb")
          insert_into_file "app/controllers/application_controller.rb", APPLICATION_CONFIG_TXT, :after => "protect_from_forgery"
        else
          raise 'Couldn\'t find application_controller file'
        end
      end

      def copy_config_file
        copy_file 'under_construction.yml', 'config/under_construction.yml'
      end

      def config_route_file
        file_path = 'config/routes.rb'
        if ::Rails::VERSION::MAJOR >= 4
          gsub_file file_path, /#{Regexp.escape(ROUTES_CLEAR_TXT)}/, ''
          insert_into_file file_path, ROUTES_CONFIG_TXT, after: /Rails.application.routes.draw do/
          gsub_file file_path, /(Rails.application.routes.draw do)(.*)(end)/m, '\1\2'+"#{ROUTES_REDIRECT_TO_TXT}" + '\3'
        else
          gsub_file file_path, /#{Regexp.escape(ROUTES_CLEAR_TXT)}/, ''
          insert_into_file file_path, ROUTES_CONFIG_TXT, after: /Application.routes.draw do/
          gsub_file file_path, /(Application.routes.draw do)(.*)(end)/m, '\1\2'+"#{ROUTES_REDIRECT_TO_TXT}" + '\3'
        end
      end

      def copy_index_file_to_app
        directory 'under_construction', 'app/views/under_construction'
      end

      def copy_scheduler_initializer
        destination_path = 'config/initializers/under_construction_scheduler.rb'
        copy_file 'under_construction_scheduler.rb', destination_path
      end
    end
  end
end
