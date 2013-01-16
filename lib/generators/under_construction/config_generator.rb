require_relative 'generators'

module UnderConstruction
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      desc 'Configs application controller'
      def edit_application_Controller
        # if File.exist?("app/controllers/application_controller.rb")
          insert_into_file "app/controllers/application_controller.rb", CONFIG_TXT, :after => "protect_from_forgery"
        # else
          # raise 'Couldn\'t find application_controller file'
        # end
      end

      def schedule_the_end_time
        UnderConstruction::Schedule.new('3 seconds from now')
      end
    end
  end
end