class SaverGuest < ApplicationRecord
	has_many :tickets
	has_many :bills, through: :tickets

	def create_ticket
		@ticket = Ticket.new
		@ticket.saver_guest = self
		@ticket.save
	end
end
