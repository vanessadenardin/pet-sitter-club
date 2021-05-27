Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # users (client and pet sitter) profile page
  get '/profile', to: 'users#show'


  resources :pet_sitters
  # add and remove services by pet sitters
  post 'add_service', to: 'pet_sitters#add_service', as: 'add_service'
  post 'remove_service', to: 'pet_sitters#remove_service', as: 'remove_service'

  resources :services

  resources :pets

  resources :orders
  # pet sitter can mark when order is completed
  post 'orders/complete_order_service', to: 'orders#complete_order_service', as: 'complete_order_service'

  # page to leave an order review 
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
