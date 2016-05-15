Rails.application.routes.draw do
  resources :messages
  resources :teams do
    member do
      put 'join'
      put 'leave'
    end
  end
  resources :projects

  root to: 'visitors#index'

  devise_for :users, class_name: 'FormUser', controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :users

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end
end
