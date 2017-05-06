Rails.application.routes.draw do
  resources :listings
  resources :companies
  devise_for :employers
  devise_for :users
  resources :admin, controller: "boards"
  devise_for :admins

  match '', to: 'listings#index', via: :get, constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root to: 'home#index'
end
