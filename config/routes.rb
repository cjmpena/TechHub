Rails.application.routes.draw do
  get 'order_confirmations/show'
  resources :carts, only: [:show, :destroy] do
    post 'add/:product_id', to: 'carts#add', on: :member, as: :add_to_cart
    patch 'update_quantity/:line_item_id', to: 'carts#update_quantity', on: :member, as: :update_quantity
    delete 'remove/:line_item_id', to: 'carts#remove', on: :member, as: :remove
  end
 
  resources :products, only: [:index, :show]
 
  resources :checkout, only: [:new, :create]
 
  root 'home#index'
  get 'home/index'
  get 'categories/:id/products', to: 'home#category_products', as: :category_products
  get 'search', to: 'home#search', as: :search
  get 'checkout/confirmation', to: 'checkout#confirmation'
  get 'checkout/new', to: 'checkout#new', as: 'checkout_new'
  post 'checkout/new', to: 'checkout#create', as: 'checkout'
  get 'order_confirmations/:id', to: 'order_confirmations#show', as: 'order_confirmation'
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
 
  get '/customers/edit_details', to: 'customers/registrations#edit_details', as: :edit_details_customers
  patch '/customers/update_details', to: 'customers/registrations#update_details', as: :update_details_customers
 
  resources :customers, only: [:show] do
    get :edit
  end
 
  get "up" => "rails/health#show", as: :rails_health_check
 
  resources :orders, only: [:index]
 end
 