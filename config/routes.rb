Rails.application.routes.draw do
  resources :carts, only: [:show, :destroy] do
    post 'add/:product_id', to: 'carts#add', on: :member, as: :add_to_cart
    patch 'update_quantity/:line_item_id', to: 'carts#update_quantity', on: :member, as: :update_quantity
    delete 'remove/:line_item_id', to: 'carts#remove', on: :member, as: :remove
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

  get "up" => "rails/health#show", as: :rails_health_check
end
