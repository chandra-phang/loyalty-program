Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#index"

  get 'customers/index'
  get 'customers/show'
end
