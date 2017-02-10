Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources "companies"
  get "/companies/:id/edit/:area_id" => "companies#delete"
  get "/companies/:id/edit/:area_id" => "companies#edit"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
