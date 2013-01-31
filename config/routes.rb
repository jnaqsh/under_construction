Rails.application.routes.draw do
  resources 'under_construction_email_storage', only: :create

  get 'under_construction/index'
  match "under_construction" => "UnderConstruction#index"
  match "/*other" => redirect("/under_construction")
end
