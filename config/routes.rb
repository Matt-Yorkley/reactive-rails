Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :subscriptions, only: [:index, :show]
  resources :courses, only: [:index, :show]
  resources :users, only: [:index, :show, :update]

  namespace :admin do
    resources :subscriptions
    resources :courses
    resources :users
  end
end
