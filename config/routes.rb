Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'products#index'

  resources :products, only: [:index, :new, :show, :create] do
    collection do
      get :purchase_confirmation
      get :get_middle_categories
      get :get_small_categories
      get :judge_get_sizes
      get :judge_brand
    end
  end

  resources :user_details, only: [:index]

  resources :users, only: [:show, :new] do
    collection do
      get :logout
      get :credit
      get :credit_create
    end
  end
end
