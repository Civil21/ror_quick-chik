Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/about'	

  devise_for :users

  resources :userparams

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :categories,only:[:index,:show]

  get "ratings/:id/positiv_vote", to: "institutions#positiv_vote", as:"rating_positiv"
  get "ratings/:id/negativ_vote", to: "institutions#negativ_vote", as:"rating_negativ"

  get "institution_comments/:id/positiv_vote", to: "institution_comments#positiv_vote", as:"institution_comment_positiv"
  get "institution_comments/:id/negativ_vote", to: "institution_comments#negativ_vote", as:"institution_comment_negativ"

  resources :institutions do
  	member do
  		patch :rating
  	end
  resources :institution_comments ,only:[:create,:update,:destroy]
  end

  get "rating_comments/:id/positiv_vote", to: "rating_comments#positiv_vote", as:"rating_comment_positiv"
  get "rating_comments/:id/negativ_vote", to: "rating_comments#negativ_vote", as:"rating_comment_negativ"

  resources :rating, only:[] do
    resources :rating_comments,only:[:create,:update,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
