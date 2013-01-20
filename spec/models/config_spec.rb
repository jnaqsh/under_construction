require 'spec_helper'

describe UnderConstruction::Configuration do
  it "loads the yaml file" do
    UnderConstruction.config.theme.should eq('site-under-construction')
  end
end