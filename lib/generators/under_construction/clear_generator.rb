require_relative 'constants'

module UnderConstruction
  module Generators
    class ClearGenerator < ::Rails::Generators::Base
      desc 'Clears configs application controller'
      def clear_application_controller
        if File.exist?('app/controllers/application_controller.rb')
          # remove the exact block we've inserted. We don't want
          # to remove the block if user has edited it
          gsub_file 'app/controllers/application_controller.rb', /#{Regexp.escape(APPLICATION_CONFIG_TXT)}/,
            ''
        end
      end

      def clear_routes_file
        file_path = 'config/routes.rb'
        gsub_file file_path, /#{Regexp.escape(ROUTES_CONFIG_TXT)}/, ''
        gsub_file file_path, /#{Regexp.escape(ROUTES_REDIRECT_TO_TXT)}/, ''
        if ::Rails::VERSION::MAJOR >= 4
          insert_into_file file_path, ROUTES_CLEAR_TXT, after: /Rails.application.routes.draw do/
        else
          insert_into_file file_path, ROUTES_CLEAR_TXT, after: /Application.routes.draw do/
        end
      end

      def remove_scheduler_file
        file_path = 'config/initializers/under_construction_scheduler.rb'
        if File.exist? file_path
          remove_file file_path
        end
      end
    end
  end
end
