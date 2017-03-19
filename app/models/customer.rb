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

   def self.from_omniauth(auth)
    # create or find the identity
    @identity = Identity.from_omniauth(auth)

    @customer = @identity.customer

    # check if no customer attached to that identity
    if @customer.nil?

      # check to see if omniauth email is associated with an existing customer
      @email = auth.info.email
      @customer = @customer.where(email: @email).first

      # check if still no customer found; create customer if that's the case
      if @customer.nil?
        @customer = Customer.new(
          first_name: auth.info.name,
          email: @email,
          invite_url_param: @customer.email.split("@").first.tr(".", ""),
          password: Devise.friendly_token[0,20]
        )
        @customer.save!
        # send an email welcoming them and asking them to send bill
        CustomerMailer.signup_bill(@customer).deliver
        # create a ticket that will be used to track their bill and savings
        @ticket = Ticket.new
        @ticket.customer = @customer
        @ticket.save!
      end
    end

    # if identity was not attached to customer or customer was created, attach identity to customer
    if @identity.customer != @customer
      @identity.customer = @customer
      @identity.save!
    end
    @customer
  end
end
