Rails.application.routes.draw do
  resources :listings
  resources :companies
  devise_for :employers
  devise_for :users
  root 'boards#index'
  resources :boards
  devise_for :admins
end
