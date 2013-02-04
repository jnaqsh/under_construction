require 'rails/generators'

module UnderConstruction
  class Schedule
    def initialize(*args)
      @scheduler  = Rufus::Scheduler.start_new
      @end_time   = args[0]
      schedule()
    end

    def schedule
      @end_time ||= UnderConstruction.config.launch_time
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
      Rails::Generators.invoke('under_construction:clear')
      # If there's a scheduled job, remove it
      stop_schedule if jobs.size > 0
      # To make passenger to restart the application
      FileUtils.touch Rails.root + 'tmp/restart.txt'
    end
  end
end