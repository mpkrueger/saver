Rails.application.routes.draw do

  get 'challenges/saving_info'
  get 'challenges/credit_card_info'
  get 'challenges/student_loan_info'
  get 'challenges/investment_info'
  get 'challenges/saving_model'
  get 'challenges/credit_card_model'
  get 'challenges/student_loan_model'
  get 'challenges/investment_model'
  get 'challenges/saving_challenge'
  get 'challenges/investment_challenge'
  get 'challenges/get_started'
  get 'challenges/lets_chat'
  get 'challenges/new_focus'
  get 'challenges/loan_saving_model'
  get 'challenges/intro'

  get 'dashboard/final'
  get 'dashboard/index'
  get 'dashboard/feedback'
  get 'dashboard/homepage'

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :guest_users
  resources :feedbacks
  resources :intro

  resources :fin_profiles do
    collection do
      post 'increment_piggies'
      post 'reset_piggies'
    end
  end

  get 'goals/index'
  get 'goals/new_focus'

  authenticated :user do
    root to: 'dashboard#homepage'
  end

  root to: 'goals#index'

  get '/goals/introductions'

end
