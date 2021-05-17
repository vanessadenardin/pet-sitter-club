Rails.application.routes.draw do
  # get 'home/index'
  root "home#index"

  resources :profile, only: [:show]
  # get "/profile", to: "profile#show"

  resources :orders
  # get "/orders", to: "orders#index"

  resources :petsitters
  # get "/petsitters", to: "pet_sitters#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
