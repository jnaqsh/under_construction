class UnderConstructionController < ApplicationController
  layout nil
  
  def index
    assign_config_options_to_view
    @email = EmailStorage.new
    
    respond_to do |format|
      format.html { render template: "under_construction/#{@theme}/index" }
    end
  end

private
  def assign_config_options_to_view
    configs = UnderConstruction::LoadConfig.new.configs
    configs.each_pair do |key, value|
      instance_variable_set '@'+key, value
    end
  end
end
