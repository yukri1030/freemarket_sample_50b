Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }
  get 'user_confirmations/edit'
  get 'signup/successful' , to: 'signups#successful'
  root "top#index"
  resources :purchases, only: [:new]
  resources :products, only: [:index, :new, :edit, :show]
  resources :users , only: [:new, :show, :create]
  resources :cards, only: [:index, :new, :edit, :show]
  resources :user_profiles, only: [:new, :create, :edit, :update]
  resources :logouts, only: [:new]
  resources :signups, only: [:index, :show]
end
