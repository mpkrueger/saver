class SaverGuest < ApplicationRecord
	has_many :tickets

	def create_ticket
		@ticket = Ticket.new
		@ticket.saver_guest = self
		@ticket.save
	end
end
