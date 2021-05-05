Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks' ,
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  resources :users, only: [:new, :show]
  resources :items do
    resources :purchases, only: [:index, :create]
  end
end
