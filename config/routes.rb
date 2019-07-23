Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }
   get 'signup/successful' , to: 'signups#successful'
  root "products#index"
  resources :purchases, only: [:new]
  resources :products, only: [:index, :new, :edit, :show]
  resources :users , only: [:new, :show, :create]
  resources :cards, only: [:index, :new, :edit, :show]
  resources :user_profiles, only: [:new, :create, :edit, :update]
  resources :signups, only: [:index, :show]
 end