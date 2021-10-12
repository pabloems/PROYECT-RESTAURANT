Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stores do
    resources :products, only: %i[new create]
  end
end
