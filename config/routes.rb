Rails.application.routes.draw do
  
  get 'dashboard/index'

  get 'dashboard/thanks'

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :guest_users

  resources :intro

  get 'goals/index'

  root to: 'goals#index'

  get '/goals/introductions'

end
