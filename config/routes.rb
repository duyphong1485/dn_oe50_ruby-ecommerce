Rails.application.routes.draw do
  root "products#home"
  get "/home", to: "products#home"
  get "/introduce", to: "static_pages#introduce"
  get "/register", to: "accounts#new"
  post "/register", to: "accounts#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/show/:id", to: "products#show"
  resources :accounts, except: %i( index destroy )
  resources :orders, only: %i(new create)
  resources :products
  namespace :admin do
    root "static_pages#index"
  end
  resources :carts, only: [:index, :create, :destroy] do
    collection do
      get "/create_cart/:id", to: "carts#create", as: "add_to"
      get "remove/:id", to: "carts#destroy", as: "remove_from"
      put "update_cart/:id", to: "carts#update", as: "update"
    end
  end
end
