require 'spec_helper'
require 'generators/under_construction/schedule_generator'

describe UnderConstruction::Generators::ScheduleGenerator do
  destination File.expand_path("../../../tmp", __FILE__)

  before { prepare_destination }

  it "copies the template" do
    run_generator
    file("config/initializers/under_construction_scheduler.rb").should exist
  end
end