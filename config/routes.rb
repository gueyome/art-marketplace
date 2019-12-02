Rails.application.routes.draw do
  devise_for :users
  root 'artworks#index'
  resources :private_messages
  resources :categories
  resources :orders 
  resources :carts
  resources :cart_details
  resources :order_details
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
