class Ticket < ApplicationRecord
  belongs_to :saver_guest
  belongs_to :admin_user
  belongs_to :customer
  has_many :calls
  strip_attributes

  def create_customer
  	if self.customer.nil?
  		@customer = Customer.new(
  			email: "sg+#{self.saver_guest.email}",
  			invite_url_param: "sg+#{self.saver_guest.email.split("@").first}",
  			first_name: self.saver_guest.name,
  			password: "password+#{rand(1000)}"
  			)
  		@customer.save
      self.update_attributes(customer_id: @customer.id)
  	end
  end

end
