Rails.application.routes.draw do
  resources :sitems
  resources :starfolds
  devise_for :users
  resources :users
  resources :orders
  resources :items
  resources :carts
  get 'store/index'
  resources :products 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => 'store#index', :as => 'store'
end
