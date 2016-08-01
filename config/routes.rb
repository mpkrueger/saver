Rails.application.routes.draw do
  
  resources :intro
  resources :users

  get 'goals/index'

  root to: 'goals#index'
end
