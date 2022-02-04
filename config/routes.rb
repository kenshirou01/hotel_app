Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  get 'users/show'
  get 'rooms/index'
  post 'reservations/new'
  post 'reservations/show'
  post 'rooms/show'
  root to: 'users#index'
  resources :users
  resources :rooms
  resources :reservations
end
