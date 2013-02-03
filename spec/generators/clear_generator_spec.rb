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
    f = file('app/controllers/application_controller.rb')
    f.should_not contain(/before_filter :redirect_to_under_construction/)
  end

  it "comments configs from routes file" do
    run_generator
    f = File.expand_path("../../../config/routes.rb", __FILE__)
    f.should contain(/# match "\/\*other"/)
    f.should contain(/# resources 'under_construction'/)
  end

  it "remove scheduler file" do
    run_generator
    f = 'config/under_construction_scheduler.rb'
    File.exist?(f).should be_false
  end

  it "uncomments route file" do
    run_generator
    f = File.expand_path("../../../config/routes.rb", __FILE__)
    f.should contain(/match "under_construction", :to => redirect/)
  end
end