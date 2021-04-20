Rails.application.routes.draw do
  
  resources :products
  
  root 'home#index'
  get 'home/index'

  #Cart
  get 'cart' => 'carts#index'
  post 'finish' => 'carts#finish'
  post 'add_contributor' => 'carts#add_contributor'
  delete 'remove_contributor/:user_id' => 'carts#remove_contributor', as: :remove_contributor
  delete 'leave_cart/:cart_id' => 'carts#leave_cart', as: :leave_cart

  #routes for google
  match 'auth/google_oauth2/callback', to: 'sessions#create', via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

end
