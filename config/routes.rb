Rails.application.routes.draw do
  
  resources :products
  
  root 'home#index'
  get 'home/index'

  #Cart
  get 'cart' => 'carts#index'
  post 'finish' => 'carts#finish'

  #routes for google
  match 'auth/google_oauth2/callback', to: 'sessions#create', via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

end
