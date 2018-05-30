Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/about'	

  devise_for :users

  resources :userparams

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :categories,only:[:index,:show]

  get "/:type/:id/positiv_vote", to: "votes#positiv_vote", as:"positiv_vote"
  get "/:type/:id/negativ_vote", to: "votes#negativ_vote", as:"negativ_vote"

  resources :institutions do
  	member do
  		patch :rating
  	end
  resources :institution_comments ,only:[:create,:update,:destroy]
  end

  resources :rating, only:[] do
    resources :rating_comments,only:[:create,:update,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
