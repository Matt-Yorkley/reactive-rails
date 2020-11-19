Rails.application.routes.draw do
  root to: "home#index"

  resources :subscriptions
  resources :courses
  resources :users
end
