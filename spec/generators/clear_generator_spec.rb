require 'spec_helper'
require 'generators/under_construction/clear_generator'

def copy_files
  application_controller = File.expand_path("../templates/clear/application_controller.rb", __FILE__)
  destination = File.join(destination_root, 'app', 'controllers')

  FileUtils.mkdir_p(destination)
  FileUtils.cp application_controller, destination
end

describe UnderConstruction::Generators::ClearGenerator do
  destination File.expand_path("../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_files
  end

  it "clears configs from application_controller" do
    run_generator
    f = file(Rails.root + 'app/controllers/application_controller.rb')
    f.should_not contain(/before_filter :redirect_to_under_construction/)
  end

  it "clear route file" do
    run_generator
    f = Rails.root + 'config/routes.rb'
    f.should_not contain(/match "\/\*other"/)
    f.should_not contain(/resources 'under_construction'/)
    f.should contain('match "under_construction", :to => redirect(\'/\')')
  end

  it "removes view files" do
    f = Rails.root + 'app/views/under_construction'
    FileUtils.mkdir_p f
    run_generator
    file(f).should_not exist
  end

  it "remove scheduler file" do
    f = Rails.root + 'config/under_construction_scheduler.rb'
    FileUtils.touch f
    run_generator
    file(f).should_not exist
  end
end