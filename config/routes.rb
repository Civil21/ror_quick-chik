Rails.application.routes.draw do


  root to: 'pages#index'
  get 'pages/about'	

  devise_for :users , controllers: { registrations: "registrations" }
  
  get "/:type/:id/positiv_vote", to: "votes#positiv_vote", as:"positiv_vote"
  get "/:type/:id/negativ_vote", to: "votes#negativ_vote", as:"negativ_vote"

  resources :userparams

  resources :categories, only:[:index,:show]

  resources :institutions do
  	member do
  		patch :rating
  	end
  resources :institution_comments ,only:[:create,:update,:destroy]
  end

  resources :rating, only:[] do
    resources :rating_comments,only:[:create,:update,:destroy]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) 

end
