class TicketsController < ApplicationController
	def new
	end

	def create
		@ticket = Ticket.new(ticket_params)
		@saver_guest = SaverGuest.find_by_id(params[:saver_guest_id])
		@ticket.saver_guest_id = @saver_guest.id
		@ticket.type = "bill"
		@ticket.save
	end

	private

	def ticket_params
		params.require(:ticket).permit(:admin_user_id, :saver_guest_id, :has_bill, :has_phone, :gave_consent, :call_complete, :summary_email_sent, 
		:successfully_saved_money, :amount_saved, :owes_money, :has_paid, :has_referred, :status, :future_followup,
		:service_provider, :zip_code, :old_monthly_rate, :tv_service, :internet_service, :phone_service)
	end
end
