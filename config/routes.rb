Rails.application.routes.draw do
  

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users do
    resources :carts
    resources :orders
    resources :artworks
    resources :contacts
  end
  resources :conversations
  resources :cart_details
  resources :order_details
  resources :categories
  resources :private_messages
  resources :testimonials 
  resources :search
  resources :results
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :artworks, only: [:show] do
    resources :avatar_artworks, only: [:create]
  end
  
end
