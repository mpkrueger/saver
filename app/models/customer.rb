class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

   has_many :invites
   has_many :tickets
   has_many :payment_methods
   has_many :payments

   validates :invite_url_param, presence: true, uniqueness: true

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.provider = auth.provider
      customer.uid = auth.uid
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0,20]
      customer.first_name = auth.info.name   # assuming the customer model has a name
      
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # customer.skip_confirmation!
    end
  end
end
