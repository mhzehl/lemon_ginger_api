Rails.application.routes.draw do
  root to: 'recipes#index'
  get '/about', to: 'pages#about'
  get '/admin', to: 'admin/recipes#index'
  get '/api/recipes/week', to: 'api/recipes#week'

  resources :recipes, only: [:show, :index]

  namespace :api do
    resources :recipes, only: [:show, :index]
    resources :categories, only: [:show, :index]
    resources :products, only: [:show, :index]
  end

  namespace :admin do
    resources :recipes
    resources :categories
    resources :products
    resources :photos, only: [:destroy]
  end

  devise_for :admin
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :photos

end
