Rails.application.routes.draw do
  resources 'email_storage', only: :create

  get 'under_construction/index'
  match "under_construction" => "UnderConstruction#index"
end
