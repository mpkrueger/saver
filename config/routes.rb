Rails.application.routes.draw do
  
  resources :guest_users

  resources :intro

  get 'goals/index'

  root to: 'goals#index'

  get '/goals/introductions'

end
