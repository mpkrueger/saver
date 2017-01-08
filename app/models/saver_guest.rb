class SaverGuest < ApplicationRecord
	has_many :tickets
	has_many :bills, through: :tickets
	has_many :payment_methods

	def create_ticket
		@ticket = Ticket.new
		@ticket.saver_guest = self
		@ticket.save
	end
end
