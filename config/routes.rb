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
  resources :orders, only: [:new, :create]
  resources :products
  resources :carts, only: [:index, :create, :destroy] do
    collection do
      get "/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
      get "remove/:id", to: "carts#remove_from_cart", as: "remove_from"
      put "update_cart/:id", to: "carts#update_cart", as: "update"
    end
  end
end
