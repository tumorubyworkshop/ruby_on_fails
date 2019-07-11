Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :products
  resources :cart_items, only: [:destroy]
  get '/cart', to: 'carts#index'
  get '/cart/add', to: 'carts#add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
