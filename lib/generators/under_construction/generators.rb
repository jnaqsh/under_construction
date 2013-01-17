module UnderConstruction
  module Generators
    CONFIG_TXT = <<-EOM

  # Editing UnderConstruction block causes it's clear generator to not work
  before_filter :redirect_to_under_construction

  # Will redirect all requests to under construction page
  def redirect_to_under_construction
    unless request.url =~ /(under_construction|email_storage)/ 
      redirect_to under_construction_path
    end
  end
  EOM
  end
end