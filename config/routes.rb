Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :courses, only: [:index, :show]
  resources :notifications, only: [:index, :show]
  resources :subscriptions, only: :index
  resources :users, shallow: true do
    resources :messages, only: [:index, :create]
  end

  namespace :admin do
    root to: "courses#index"

    resources :courses, except: :show do
      post :bulk_update, on: :collection, as: :bulk_update
    end
    resources :notifications, except: :show
    resources :subscriptions, except: :show
    resources :users, except: :show do
      member do
        resources :messages, only: [:index, :create]
      end
    end
  end
end
