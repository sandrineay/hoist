# require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'
  get "/profile", to: 'users#show'
  get "/download", to: 'boat_profiles#download'

  resources :users, only: :update
  resources :boat_profiles, only: [:index, :show]
  resources :listings, only: [:index, :create]

  # authenticate :user, lambda { |u| u.admin } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
end
