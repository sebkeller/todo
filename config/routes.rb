Rails.application.routes.draw do
  root "tasks#index"

  resources :tasks do
    member do
      patch :move
    end
  end
  resources :users, only: [:show, :new, :create], path_names: { new: 'sign_up' }
  resources :sessions, only: [:new, :create, :destroy], path_names: { new: 'sign_in' }
end
