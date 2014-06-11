require 'spec_helper'
require 'generators/under_construction/clear_generator'

describe UnderConstruction::Generators::ClearGenerator, :type => :generator do
  destination File.expand_path("../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_file(
      File.expand_path("../templates/clear/application_controller.rb", __FILE__),
      File.join(destination_root, 'app', 'controllers')
    )
    copy_file(
      File.expand_path("../templates/clear/routes.rb", __FILE__),
      File.join(destination_root, "config")
    )
    File.stub(:exist?) { true }
  end

  it 'should run all tasks in clear generator' do
    gen = generator %w(clear)
    gen.should_receive :clear_application_controller
    gen.should_receive :clear_routes_file
    gen.should_receive :remove_scheduler_file
    capture(:stdout) { gen.invoke_all }
  end

  context 'sth' do
    before do
      run_generator
    end

    it "clears configs from application_controller" do
      f = file('app/controllers/application_controller.rb')
      f.should_not contain('before_filter :redirect_to_under_construction')
    end

    it "clear route file" do
      f = file('config/routes.rb')
      f.should_not contain(/match "\/\*other"/)
      f.should_not contain(/resources 'under_construction'/)
      f.should contain('match "under_construction", :to => redirect(\'/\'), via: :all')
    end
  end

  context 'remove scheduler' do
    let(:path) { destination_root + '/config/initializers' }

    before do
      FileUtils.mkdir_p path
      FileUtils.touch path + '/under_construction_scheduler.rb'
      run_generator
    end

    it "remove scheduler file" do
      File.unstub(:exist?)
      file(path + '/under_construction_scheduler.rb').should_not exist
    end
  end
end
