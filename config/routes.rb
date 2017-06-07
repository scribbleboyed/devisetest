Rails.application.routes.draw do
  devise_for :employers, :controllers => {:registrations => "employers/registrations", :sessions => "employers/sessions", :passwords => "employers/passwords"}
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords"}
  devise_for :admins, :controllers => {:registrations => "admins/registrations", :sessions => "admins/sessions", :passwords => "admins/passwords"}

  resources :listings
  resources :companies
  get 'admin', to: 'admin#index'
  get 'admin/dashboard', to: 'admin#dashboard'
  get 'admin/listings', to: 'admin#listings', as: 'admin_listings'
  get 'admin/companies', to: 'admin#companies', as: 'admin_companies'

  match '', to: 'listings#index', via: :get, constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root to: 'home#index'

  get '/employers/dashboard', to: 'employers#dashboard', as: 'employer_dashboard'
  get '/employers/listings', to: 'employers#listings', as: 'employer_listings'
  get '/employers/profile', to: 'employers#profile', as: 'employer_profile'
  put '/employers/profile', to: 'employers#update_profile', as: 'employer_update_profile'
end
