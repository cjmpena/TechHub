Rails.application.routes.draw do
  resources :carts, only: [:show] do
    post 'add/:product_id', to: 'carts#add', on: :collection, as: :add_to_cart
  end
  resources :products, only: [:index, :show]
  root 'home#index'
  get 'home/index'
  get 'categories/:id/products', to: 'home#category_products', as: :category_products
  get 'search', to: 'home#search', as: :search
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: {
    sessions: 'customers/sessions'
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
