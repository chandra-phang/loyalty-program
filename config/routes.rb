Rails.application.routes.draw do
  get 'completed_order/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#index"

  get 'customers/index'
  get 'customers/show'

  post 'completed_orders/report' => 'completed_orders#create'
end
