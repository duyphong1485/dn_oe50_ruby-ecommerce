Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home"
  get "/introduce", to: "static_pages#introduce"
  get "/detail", to: "static_pages#detail"
end
