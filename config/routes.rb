Rails.application.routes.draw do
  devise_for :users
  resources :categories
  unauthenticated :user do
    root to: 'home#index'
  end
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
