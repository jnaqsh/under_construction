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

      def copy_config_file
        copy_file 'under_construction.yml', Rails.root + 'config/under_construction.yml'
      end

      def uncomment_all_routes_to_redirect_to_under_construction
        file = File.expand_path('../../../../config/routes.rb', __FILE__)
        uncomment_lines file, /match "\/\*other"/
        uncomment_lines file, /resources 'under_construction', only: :index/
      end

      def comment_redirection_of_under_construction_to_root
        file = File.expand_path('../../../../config/routes.rb', __FILE__)
        comment_lines file, /match "under_construction", :to => redirect/
      end

      def copy_index_file_to_app
        file = Rails.root + 'app/views/under_construction/site-under-construction'
        empty_directory file
        copy_file 'index.html.erb', file + 'index.html.erb'
      end
    end
  end
end