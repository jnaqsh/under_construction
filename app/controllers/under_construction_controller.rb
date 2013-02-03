class UnderConstructionController < ApplicationController
  layout false
  
  def index
    assign_config_options_to_view
    @email = UnderConstructionEmailStorage.new
    
    respond_to do |format|
      format.html { render template: "under_construction/#{@theme}/index" }
    end
  end

private
  def assign_config_options_to_view
    configs = UnderConstruction.config_file
    configs.each_pair do |key, value|
      instance_variable_set '@'+key, value
    end
  end
end
