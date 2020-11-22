Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :subscriptions, only: :index
  resources :courses, only: [:index, :show]

  namespace :admin do
    root to: "courses#index"

    resources :courses, except: :show do
      post :bulk_update, on: :collection, as: :bulk_update
    end
    resources :subscriptions, except: :show
    resources :users, except: :show
  end
end
