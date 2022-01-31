Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  get 'home/index'
  root to: 'users#index'
  resources :users
  resources :rooms
end
