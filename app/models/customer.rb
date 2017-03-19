class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

   has_many :invites
   has_many :tickets
   has_many :payment_methods
   has_many :payments
   has_many :identities

   validates :invite_url_param, presence: true, uniqueness: true

   def self.find_with_omniauth(auth, signed_in_resource = nil)
    # Get the identity and customer if they exist
    identity = Identity.find_with_omniauth(auth)

    # If a signed_in_resource is provided it always overrides the existing customer
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    customer = signed_in_resource ? signed_in_resource : identity.customer

    # Create the customer if needed
    if customer.nil?

      email = auth.info.email
      customer = customer.where(email: email).first

      if customer.nil?
        customer = customer.new(
          first_name: auth.extra.raw_info.name,
          email: email,
          invite_url_param: customer.email.split("@").first.tr(".", ""),
          password: Devise.friendly_token[0,20]
        )
        customer.save!
        # send an email welcoming them and asking them to send bill
        CustomerMailer.signup_bill(@customer).deliver
        # create a ticket that will be used to track their bill and savings
        @ticket = Ticket.new
        @ticket.customer = customer
        @ticket.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end
