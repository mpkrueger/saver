class TicketsController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_ticket
	before_action :set_s3_direct_post


	def new
	end

	def create
		
	end

	def update
		if @ticket.has_bill == false
			if @ticket.update_attributes(ticket_params)
				redirect_to bill_upload_path
			else
				flash[:error] = "uh oh"
				redirect_to terms_path
			end
		else
			if @ticket.update_attributes(ticket_params)
				redirect_to root_path
			else
				flash[:error] = "uh oh"
				redirect_to bill_upload_path
			end

		end
	end

	def terms


	end

	def bill_upload
		
	end

	private

	def ticket_params
		params.require(:ticket).permit(:admin_user_id, :customer_id, :has_bill, :has_phone, :gave_consent, :call_complete, :summary_email_sent, 
		:successfully_saved_money, :amount_saved, :amount_earned, :owes_money, :has_paid, :has_referred, :status, :future_followup,
		:service_provider, :zip_code, :old_monthly_rate, :tv_service, :internet_service, :phone_service, :bill_key)
	end

	def set_ticket
		@ticket = current_customer.tickets.last

	end

	def set_s3_direct_post
	  @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'authenticated-read', content_type: 'application/pdf', content_disposition: 'inline')
	end
end
