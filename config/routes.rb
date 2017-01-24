Rails.application.routes.draw do
  get 'home/index'
resources :home do
  get :autocomplete_city_name, :on => :collection
  get :autocomplete_company_name, :on => :collection
end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
