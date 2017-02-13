Rails.application.routes.draw do


  get 'about_us', to: 'info#about_us', as: 'about_us'
  get 'faq', to: 'info#faq', as:'faq'
  get 'privacy_policy', to: 'info#privacy_policy', as: 'privacy_policy'
  get 'terms_of_service', to: 'info#terms_of_service', as: 'terms_of_service'

  authenticated :customer do
    root to: 'dashboards#dashboard'
  end
  root to: 'onboarding#landing_page'

  constraints subdomain: "try" do
    get "/", to: 'onboarding#landing_page'
  end

  get 'dashboard', to: 'dashboards#dashboard', as: 'dashboard'
  get 'whysavvy', to: 'onboarding#why_savvy', as: 'why_savvy'
  get 'onboarding/landing_page'
  get 'privacy_policy', to: 'info#privacy_policy'
  get 'terms_of_service', to: 'info#terms_of_service'

  devise_for :customers, controllers: { registrations: "registrations" }, path: '', path_names: { sign_up: 'signup' }
  devise_for :admin_users, ActiveAdmin::Devise.config 
    ActiveAdmin.routes(self)

  resources :saver_guests do
    resources :tickets do
      resources :bills
      resources :calls
    end
    collection do
      get 'how_it_works'
      get 'signup'
      get 'thanks'
      get 'signup2'
      get 'signup3'
      get 'how_it_works2'
      get 'about_us'
      get 'bulletpoints'
      get 'stats'
      get 'testimonials'
    end
  end

  get 'pay', to: 'charges#new', as: :charge
  get 'payment_thanks', to: 'charges#payment_thanks'
  

  resources :charges

  get 'r/*sender', to: 'invites#show', as: 'landing_page'
  get 'invite', to: 'invites#new'
  resources :invites do
    collection do
      get 'thanks'
    end
  end

  

end
