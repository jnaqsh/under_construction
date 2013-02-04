require_relative 'constants'

module UnderConstruction
  module Generators
    class ClearGenerator < ::Rails::Generators::Base
      desc 'Clears configs application controller'
      def clear_application_controller
        if File.exist?('app/controllers/application_controller.rb')
          # remove the exact block we've inserted. We don't want
          # to remove the block if user has edited it
          gsub_file 'app/controllers/application_controller.rb', /#{Regexp.escape(CONFIG_TXT)}/,
            ''
        end
      end

      def comment_routes_file
        file = File.expand_path('../../../../config/routes.rb', __FILE__)
        comment_lines file, /match "\/\*other"/
        comment_lines file, /resources 'under_construction', only: :index/
      end

      def uncomment_routes_file
        file = File.expand_path('../../../../config/routes.rb', __FILE__)
        uncomment_lines file, /match "under_construction", :to => redirect\('\/'\)/
      end

      def remove_scheduler_file
        if File.exist?('config/under_construction_scheduler.rb')
          remove_file 'config/under_construction_scheduler.rb'
        end
      end
    end
  end
end