Rails.application.routes.draw do

  root to: redirect("http://try.getsavvier.com")
  authenticated :customer do
    root to: 'invites#index'
  end

  devise_for :customers, controllers: { registrations: "registrations" }
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

  resources :charges

  get 'r/*sender', to: 'invites#show', as: 'landing_page'
  get 'invite', to: 'invites#new'
  resources :invites do
    collection do
      get 'thanks'
    end
  end

  

end
