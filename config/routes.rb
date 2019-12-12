Rails.application.routes.draw do
  
 
  devise_for :users
  resources :users do
    resources :carts
    resources :orders
    resources :artworks
    resources :conversations
  end
  resources :cart_details
  resources :order_details
  resources :contacts
  resources :categories
  resources :private_messages
  resources :testimonials 
  resources :search
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :artworks, only: [:show] do
    resources :avatar_artworks, only: [:create]
  end
  
end
