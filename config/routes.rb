Rails.application.routes.draw do
  resources :listings
  resources :companies
  devise_for :employers, :controllers => {:registrations => "employers/registrations", :sessions => "employers/sessions", :passwords => "employers/passwords"}
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords"}
  resources :admin, controller: "boards"
  devise_for :admins

  match '', to: 'listings#index', via: :get, constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root to: 'home#index'
end
