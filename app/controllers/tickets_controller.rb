class TicketsController < ApplicationController
	def new
	end

	def create
		@ticket = Ticket.new
		@saver_guest = SaverGuest.find_by_id(params[:saver_guest_id])
		@ticket.saver_guest_id = @saver_guest.id
		@ticket.type = "bill"
		@ticket.save
	end
end
