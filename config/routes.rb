Rails.application.routes.draw do
  
  resources :products
  root 'home#index'
  
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :sessions, only: [:create, :destroy]

  #routes for google
  match 'auth/google_oauth2/callback', to: 'sessions#create', via: [:get, :post]

  get 'signout', to: 'sessions#destroy', as: 'signout'

end
