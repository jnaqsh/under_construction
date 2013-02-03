require 'spec_helper'
require 'generators/under_construction/config_generator'

def copy_files
  application_controller = File.expand_path("../templates/config/application_controller.rb", __FILE__)
  destination = File.join(destination_root, "app/controllers")
  
  FileUtils.mkdir_p(destination)
  FileUtils.cp application_controller, destination
end

def remove_view_directory
  FileUtils.rm_rf Rails.root + 'app/views/under_construction'
end

describe UnderConstruction::Generators::ConfigGenerator do
  destination File.expand_path("../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_files
  end

  after :all do
    remove_view_directory
  end

  it "configs the application controller" do
    run_generator
    f = file('app/controllers/application_controller.rb')
    f.should contain(/redirect_to under_construction_path\n/)
    # f.should contain(Regexp.escape(UnderConstruction::Generators::CONFIG_TXT))
  end

  it "configs the gems routes file" do
    run_generator
    f = File.expand_path("../../../config/routes.rb", __FILE__)
    f.should contain(/match "\/\*other"/)
    f.should contain(/resources 'under_construction', only: :index/)
  end

  describe 'when application_controller.rb does not exist' do
    let(:real_application_controller_path ) { Rails.root + 'app/controllers/application_controller.rb'}
    let(:stash_application_controller_path) { 'stash_application_controller.rb'}
    before do
      FileUtils.mv real_application_controller_path, stash_application_controller_path
    end
    after do
      FileUtils.mv stash_application_controller_path, real_application_controller_path
    end
    it 'should raise an error' do
      expect { run_generator }.to raise_error "Couldn't find application_controller file"
    end
  end

  it "copies the config file" do
    run_generator
    f = Rails.root + 'config/under_construction.yml'
    (File.exist? f).should be_true
  end

  it "should comment redirect lines in routes file" do
    run_generator
    f = File.expand_path("../../../config/routes.rb", __FILE__)
    f.should contain(/# match "under_construction", :to => redirect/)
  end

  it "should copy the index file to user app" do
    run_generator
    f = Rails.root + 'app/views/under_construction/site-under-construction/index.html.erb'
    (File.exist? f).should be_true
  end
end