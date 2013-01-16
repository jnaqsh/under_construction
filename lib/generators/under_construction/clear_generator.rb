require_relative 'generators'

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
    end
  end
end