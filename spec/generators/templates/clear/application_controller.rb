class ApplicationController < ActionController::Base
  protect_from_forgery
  # Editing UnderConstruction block causes it's clear generator to not work
  before_filter :redirect_to_under_construction

  # Will redirect all requests to under construction page
  def redirect_to_under_construction
    if request.host_with_port == UnderConstruction.config.host_name && Rails.env.production?
      unless request.url =~ /(under_construction|email_storage)/
        redirect_to under_construction_index_path
      end
    end
  end

  def method_name
    'hit there'
  end
end
