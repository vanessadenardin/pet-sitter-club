Rails.application.routes.draw do
  get 'service/create'
  get 'service/show'
  get 'service/edit'
  get 'service/delete'
  devise_for :users
  # get 'home/index'
  root "home#index"

  # resources :profile, only: [:show]
  get "/profile", to: "users#show"
  # get "/profile", to: "profile#show"

  resources :orders
  # get "/orders", to: "orders#index"

  resources :pet_sitters
  # get "/petsitters", to: "pet_sitters#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
