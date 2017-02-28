Rails.application.routes.draw do
  get 'recipes/index'

  namespace :api do
  end

  namespace :admin do
  end

  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'pages#home'

end
