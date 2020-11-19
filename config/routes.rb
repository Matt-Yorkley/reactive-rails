Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :subscriptions
  resources :courses
  resources :users
end
