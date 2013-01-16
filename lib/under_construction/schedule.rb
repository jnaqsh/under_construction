require 'rails/generators'

module UnderConstruction
  class Schedule
    def initialize(*args)
      @scheduler  = Rufus::Scheduler.start_new
      @end_time   = args[0]
      schedule()
    end

    def schedule
      @end_time ||= UnderConstruction.config.end_date
      @job = @scheduler.at Chronic.parse(@end_time) do
        invoke_clear_generator()
      end
    end

    # Stop the schedule
    def stop_schedule
      @job.unschedule
    end

    # Shows all schaduled jobs. just for testing perposes
    def jobs
      @scheduler.jobs
    end

  private
    def invoke_clear_generator
      # `rails generate under_construction:clear`
      Rails::Generators.invoke('under_construction:clear')
      stop_schedule if jobs.size > 0
    end
  end
end