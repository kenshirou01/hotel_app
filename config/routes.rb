Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  get 'users/show'
  get 'rooms/index'
  post 'reservations/new'
  post 'reservations/show'
  post 'rooms/show'
  root to: 'users#index'
  resources :reservations
  resources :users
  resources :rooms do
    collection do
      get :search
    end
  end
end
