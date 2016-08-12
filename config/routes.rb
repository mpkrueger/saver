Rails.application.routes.draw do
  
  get 'dashboard/final'
  get 'dashboard/index'

  get 'dashboard/thanks'
  get 'dashboard/homepage'

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :guest_users
  resources :feedbacks
  resources :intro

  get 'goals/index'

  root to: 'goals#index'

  get '/goals/introductions'

end
