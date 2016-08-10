Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :guest_users

  resources :intro

  get 'goals/index'

  root to: 'goals#index'

  get '/goals/introductions'

end
