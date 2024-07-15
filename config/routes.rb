Rails.application.routes.draw do
  resources :colleges, only: :index
  get "colleges/search", to: "colleges#search"
  get "colleges/show_more", to: "colleges#show_more"
  get "colleges/show_map", to: "colleges#show_map"

  # On a more refined structure, we can keep smaller and more specialized controller
  # namespace :colleges do
  #   resources :show_more, only: :index
  #   resource :search, only: :show
  # end

  # Defines the root path route ("/")
  root "colleges#index"
end
