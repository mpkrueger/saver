Rails.application.routes.draw do


  get 'about-us', to: 'info#about-us', as: 'about-us'
  get 'faq', to: 'info#faq', as:'faq'
  get 'privacy-policy', to: 'info#privacy-policy', as: 'privacy-policy'
  get 'terms-of-service', to: 'info#terms-of-service', as: 'terms-of-service'

  authenticated :customer do
    root to: 'dashboards#dashboard'
  end
  root to: 'onboarding#landing-page'

  constraints subdomain: "try" do
    get "/", to: 'onboarding#landing-page'
  end

  get 'dashboard', to: 'dashboards#dashboard', as: 'dashboard'
  get 'why-savvy', to: 'onboarding#why-savvy', as: 'why-savvy'
  get 'onboarding/landing-page'
  get 'privacy-policy', to: 'info#privacy_policy'
  get 'terms-of-service', to: 'info#terms-of-service'

  get 'bill-upload', to: 'tickets#bill-upload'
  get 'terms', to: 'tickets#terms'

  get '2', to: 'onboarding#landing-page-photo2'
  get '3', to: 'onboarding#landing-page-vector'
  get '4', to: 'onboarding#landing-page-painpoints'
  get '5', to: 'onboarding#landing-page-busymom'
  get '6', to: 'onboarding#landing-page-busyguy'

  devise_for :customers, controllers: { registrations: "registrations", omniauth_callbacks: "customers/omniauth_callbacks" }, path: '', path_names: { sign_up: 'sign-up', sign_in: 'sign-in' }
  devise_for :admin_users, ActiveAdmin::Devise.config 
    ActiveAdmin.routes(self)

  resources :tickets do
    resources :calls
  end

  resources :questions

  get 'contact-us', to: 'questions#new'

  resources :saver_guests do
    collection do
      get 'how-it-works'
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
  get 'payment-thanks', to: 'charges#payment-thanks'
  

  resources :charges

  get 'pay', to: 'charges#new'
  get 'payment_thanks', to: 'charges#create'


  get 'r/*sender', to: 'invites#show', as: 'landing_page'

  get 'invite', to: 'invites#new'
  resources :invites do
    collection do
      get 'thanks'
    end
  end

  

end
