Rails.application.routes.draw do
  
  devise_for :users
  resources :users do
    resources :carts
    resources :orders
    resources :artworks
  end
  resources :cart_details
  resources :order_details
  resources :contacts
  resources :categories
  resources :private_messages
  resources :testimonials 
  root 'pages#index'
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
    resources :users, only: [:show]
  end

  Rails.application.routes.draw do
    resources :users, only: [:show] do
      resources :avatars, only: [:create]
    end
  end
end