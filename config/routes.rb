Rails.application.routes.draw do
  resources 'under_construction_email_storage', only: :create

  resources 'under_construction', only: :index
  # match "under_construction", :to => redirect('/')
  match "/*other" => redirect("/under_construction")
end
