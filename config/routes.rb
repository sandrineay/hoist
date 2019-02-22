Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'
  get "/profile", to: 'users#show'

  resources :users, only: :update
  resources :boat_profiles, only: :index
end
