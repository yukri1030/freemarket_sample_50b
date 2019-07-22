Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:index, :edit, :show, :new]
  resources :users , only: [:new,:show]
  resources :user_profiles, only: [:new, :create, :edit, :update]
  resources :signups, only: [:index, :new, :show]
end
