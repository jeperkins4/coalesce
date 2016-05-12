Rails.application.routes.draw do
  resources :teams
  resources :projects

  root to: 'visitors#index'

  devise_for :users
  resources :users
end
