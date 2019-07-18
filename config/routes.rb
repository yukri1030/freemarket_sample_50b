Rails.application.routes.draw do
  root "products#index"
  resources :users , only: [:new]
  resources :profiles, only: [:new]
end