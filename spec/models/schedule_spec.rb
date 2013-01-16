require "spec_helper"

describe UnderConstruction::Schedule do
  let(:schedule) { UnderConstruction::Schedule.new('2 seconds from now') }
  
  it "should schadule" do
    expect(schedule.jobs.size).to eq(1)
    schedule.stop_schedule
  end
end