Rails.application.routes.draw do
  resources :teams do
    member do
      put 'join'
    end
  end
  resources :projects

  root to: 'visitors#index'

  devise_for :users
  resources :users
end
