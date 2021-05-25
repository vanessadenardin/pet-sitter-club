Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  root 'home#index'

  get '/profile', to: 'users#show'


  resources :pet_sitters
  post 'add_service', to: 'pet_sitters#add_service', as: 'add_service'
  post 'remove_service', to: 'pet_sitters#remove_service', as: 'remove_service'
  # get "/petsitters", to: "pet_sitters#index"

  resources :services

  resources :pets

  resources :orders
  # get "/orders", to: "orders#index"
  resources :reviews
  # post 'review', to: 'orders#leave_review', as: 'leave_review'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
