Rails.application.routes.draw do
  root "products#index"
  resources :users , only: [:new,:show]
  resources :profiles, only: [:new]
end
