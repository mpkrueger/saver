class CallsController < ApplicationController
	def new
	end

	def create
		@call = Call.new(call_params)
		@call.ticket = Ticket.find(call_params[:ticket_id])
		@call.save!
	end

	private

	def call_params
		params.require(:call).permit(:start_time, :end_time, :agent_name, :new_monthly_rate, :courtesy_credit, :confirmation_number, :notes, :ticket_id)
	end
end
