Rails.application.routes.draw do
  

  get 'goals/index'

  root to: 'goals#index'
end
