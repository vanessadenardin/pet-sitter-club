Rails.application.routes.draw do
  # get 'home/index'
  root "home#index"

  get "/profile", to: "profile#show"

  get "/orders", to: "orders#index"

  get "/petsitters", to: "pet_sitters#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
