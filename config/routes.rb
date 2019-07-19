Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:index, :edit, :show]
  resources :users , only: [:new,:show]
  resources :profiles, only: [:new]
end
