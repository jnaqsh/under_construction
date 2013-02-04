module UnderConstruction
  module Generators
    APPLICATION_CONFIG_TXT = <<-EOM

  # Editing UnderConstruction block causes it's clear generator to not work
  before_filter :redirect_to_under_construction

  # Will redirect all requests to under construction page
  def redirect_to_under_construction
    if request.host == UnderConstruction.config.host_name
      unless request.url =~ /(under_construction|email_storage)/
        redirect_to under_construction_index_path
      end
    end
  end
  EOM

    ROUTES_CONFIG_TXT = <<-EOM

  resources 'under_construction_email_storage', only: :create
  resources 'under_construction', only: :index
  match "/*other" => redirect("/under_construction")
  EOM

    ROUTES_CLEAR_TXT = <<-EOM

  match "under_construction", :to => redirect('/')
  EOM
  end
end