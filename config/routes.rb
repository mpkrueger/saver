Rails.application.routes.draw do

  get 'services/welcome'
  get 'services/overview'
  get 'services/factors'
  get 'services/fees'
  get 'services/easeandflex'
  get 'services/reputation'
  get 'services/summary'
  get 'services/recommendation'
  get 'services/choice'
  get 'services/vanguard'
  get 'services/betterment'

  get 'challenges/saving_info'
  get 'challenges/credit_card_info'
  get 'challenges/student_loan_info'
  get 'challenges/retirement_info'
  get 'challenges/stock_market_info'
  get 'challenges/saving_model'
  get 'challenges/credit_card_model'
  get 'challenges/student_loan_model'
  get 'challenges/retirement_model'
  get 'challenges/stock_market_model'
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
  get 'dashboard/savvy_score'

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :guest_users
  resources :feedbacks
  resources :intro do
    collection do
      get 'follow_up'
      get 'thanks'
    end
  end
  resources :beta_users
  resources :investing_profiles

  resources :fin_profiles do
    collection do
      post 'increment_piggies'
      post 'reset_piggies'
    end
  end

  get 'goals/index'
  get 'goals/new_focus'
  get 'goals/investing'
  get 'goals/thanks'

  authenticated :user do
    root to: 'dashboard#homepage'
  end

  root to: 'goals#investing'

  get '/goals/introductions'

end
