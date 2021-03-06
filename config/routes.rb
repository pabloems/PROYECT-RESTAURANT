Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stores do
    resources :products, only: %i[new create ]
  end
  resources :products, only: %i[index show edit update destroy]
  resources :carts, only: %i[create edit update destroy]
    get '/cart', to: 'carts#show'

  # resources :checkout, only: [:create]
  resources :cart_items, only: %i[create destroy update]
  resources :product_categories, only: %i[create destroy]
  resources :orders, only: %i[show index create update] do
     resources :payments, only: :new
  end
  resources :categories, only: :show
  # Evento para manejar el estado de la orden
  mount StripeEvent::Engine, at: '/stripe-webhooks'



end
