Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'signup/successful' , to: 'signups#successful'
  post 'signup/sms_confirmation_certify' , to: 'signups#sms_confirmation_certify'
  patch 'signup/address/create', to: 'signups#address_create'
  get 'signup/sms_confirmation' , to: 'signups#sms_confirmation_send'
  get 'signup/address', to: 'signups#address'
  get 'signup/google', to: 'signups#oauth_google'
  get 'signup/facebook', to: 'signups#oauth_facebook'
  get 'user_confirmations/edit'
  get 'signup/facebook', to: 'signup#oauth_facebook'
  
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    post 'signup/sms_confirmation' => 'signup#sms_confirmation_send'
  end
  root "top#index"
  resources :top, only: :index
  resources :products, only: [:new, :edit, :show]
  resources :purchases, only: :new

  get 'mypage', to: 'users#show'
  resources :users, only: [:new, :show, :edit] do
    resources :cards, only: [:index, :new, :destroy] do
      collection do
        get 'add', to: 'cards#add'
        post 'pay', to: 'cards#pay'
      end
    end
    resources :user_profiles, only: [:new, :create, :edit, :update]
    resources :user_confirmations, only: [:create, :edit, :update]
    resources :logouts, only: :new
  end

end
