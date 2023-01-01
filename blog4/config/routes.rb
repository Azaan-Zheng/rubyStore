Rails.application.routes.draw do
  devise_for :users
  
  root :to => 'users#index'

  # resources :comments
  resources :blogs do
    resources :comments
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
