module UnderConstruction
  module Generators
    class ScheduleGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc 'Adds schedule initializer to config/initilizer'
      def copy_schedule_initilizer
        copy_file('under_construction_scheduler.rb', 'config/initializers/under_construction_scheduler.rb')
      end
    end
  end
end