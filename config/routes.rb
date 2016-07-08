Rails.application.routes.draw do
  
  resources :houses
  resources :loans

  get 'goals/index'

  get 'goals/loan'

  get 'goals/house'

  get 'goals/retirement'

  root to: 'goals#index'
end
