Rails.application.routes.draw do
  get 'goals/index'

  get 'goals/loan'

  get 'goals/house'

  get 'goals/retirement'

  root to: 'goals#index'
end
