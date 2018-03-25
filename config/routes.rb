Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/about'	

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :categories,only:[:index,:show]

  resources :institutions do
  	member do
  		patch :rating
  	end
  resources :institution_comments ,only:[:create,:update,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
