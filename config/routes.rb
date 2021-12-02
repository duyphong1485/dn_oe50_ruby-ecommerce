Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home"
  get "/introduce", to: "static_pages#introduce"
  get "/detail", to: "static_pages#detail"
  get "/register", to: "accounts#new"
  post "/register", to: "accounts#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :accounts, only: %i(new show create)
end
