require 'spec_helper'
require 'generators/under_construction/config_generator'

def copy_files
  application_controller = File.expand_path("../templates/config/application_controller.rb", __FILE__)
  destination = File.join(destination_root, "app/controllers")
  
  FileUtils.mkdir_p(destination)
  FileUtils.cp application_controller, destination
end

describe UnderConstruction::Generators::ConfigGenerator do
  destination File.expand_path("../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_files
  end

  it "configs the application controller" do
    run_generator
    f = file('app/controllers/application_controller.rb')
    f.should contain(/before_filter :redirect_to_under_construction/)
  end
end