Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations' # rails g devise:controllers users
  }

  get 'pages/account'

  get 'pages/index'

  resources :publications 
  
  #resources :pages

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
