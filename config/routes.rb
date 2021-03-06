# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :activities
    resources :organizations
    resources :organization_forms
    resources :steps
    resources :taxation_forms
    root to: 'users#index'
  end
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :organizations
    post 'organization/:id/extract/new', to: 'statement_loaders#extract_tax', as: 'extract_tax'
    get 'organization/:id/extract/new', to: 'statement_loaders#new', as: 'extract_new'

    get 'extract_tax/:id', to: 'statement_loaders#redirect_taxes'

    resources :taxes
    resources :survey, only: %i[new create]
    resources :tasks, only: %i[index edit update]

    root 'pages#index'
  end

  devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
