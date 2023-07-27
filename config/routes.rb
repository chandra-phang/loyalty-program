# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'customers#index'

  resources :customers, only: %i[index show] do
    resources :orders, only: [:index]
  end

  # orders
  post '/orders/report', to: 'orders#create'
end
