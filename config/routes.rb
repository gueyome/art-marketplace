Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :carts
    resources :orders
  end
  resources :cart_details
  resources :order_details
  resources :contacts
  resources :artworks
  resources :categories
  resources :private_messages
  resources :testimonials 
  root 'artworks#index'
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end