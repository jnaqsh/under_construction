require 'spec_helper'
require 'generators/under_construction/config_generator'

describe UnderConstruction::Generators::ConfigGenerator do
  destination File.expand_path("../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_file(
      File.expand_path("../templates/config/application_controller.rb", __FILE__),
      File.join(destination_root, "app/controllers")
    )
    copy_file(
      File.expand_path("../templates/config/routes.rb", __FILE__),
      File.join(destination_root, "config")
    )
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

  it 'should run all tasks in config generator' do
    gen = generator %w(config)
    gen.should_receive :edit_application_Controller
    gen.should_receive :copy_config_file
    gen.should_receive :config_route_file
    gen.should_receive :copy_index_file_to_app
    gen.should_receive :copy_scheduler_initializer
    capture(:stdout) { gen.invoke_all }
  end

  it "configs the application controller" do
    run_generator
    f = file('app/controllers/application_controller.rb')
    f.should contain(/redirect_to_under_construction\n/)
  end

  it "configs the routes file" do
    run_generator
    f = file("config/routes.rb")
    f.should contain(/match "\/\*other"/)
    f.should contain(/resources 'under_construction', only: :index/)
    f.should_not contain('match "under_construction", :to => redirect(\'/\')')
  end

  it "copies the config file" do
    run_generator
    f = file('config/under_construction.yml')
    file(f).should exist
  end

  it "should copy the index file to user app" do
    run_generator
    f = file('app/views/under_construction/site-under-construction/index.html.erb')
    file(f).should exist
  end

  it "copies the scheduler initializer file" do
    run_generator
    f = file('config/initializers/under_construction_scheduler.rb')
    file(f).should exist
  end
end
