# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: 'home#index'
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  resources :groups
  resources :expenses
end
