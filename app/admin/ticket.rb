ActiveAdmin.register Ticket do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	permit_params :admin_user_id, :customer_id, :has_bill, :has_phone, :gave_consent, :call_complete, :summary_email_sent, 
		:successfully_saved_money, :amount_saved, :amount_earned, :owes_money, :has_paid, :has_referred, :status, :future_followup,
		:service_provider, :zip_code, :old_monthly_rate, :tv_service, :internet_service, :phone_service
	
	config.per_page = 100

	controller do
		belongs_to :admin_user, :customer, optional: true
	end

	batch_action :assign, form: -> { {admin_user_id: AdminUser.pluck(:email, :id)}} do |ids, inputs|
		tickets = Ticket.find(ids)
		tickets.each do |ticket|
			ticket.update_attributes(admin_user_id: inputs["admin_user_id"])
		end
		redirect_to collection_path, notice: inputs.to_s
	end

	form do |f|
		f.inputs "Signup Info" do
			f.input :customer_id, as: :select, collection: Customer.all.collect {|customer| [customer.email, customer.id]}
			f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|admin_user| [admin_user.email, admin_user.id]}
			f.input :has_bill
			f.input :has_phone
			f.input :gave_consent
		end
		f.inputs "Bill Information" do
			f.input :service_provider, as: :select, collection: ["Comcast", "Spectrum", "AT&T", "Cox", "Frontier", "Sonic", "Optimum", "Webpass", "SuddenLink", "Verizon"]
			f.input :zip_code
			f.input :old_monthly_rate
			f.input :tv_service, as: :select, collection: ["None", "Basic", "Standard", "Premium channels", "Sports Package", "Premium and Sports"]
			f.input :internet_service, as: :select, collection: ["None", "Less than 25 mbps", "25-100 mbps", "150 mbps", "200 mbps", "Over 200 mbps"]
			f.input :phone_service, as: :select, collection: ["None", "Has phone service"]
		end
		f.inputs "Ticket Outcome" do
			f.input :call_complete
			f.input :summary_email_sent
			f.input :successfully_saved_money
			f.input :amount_saved
			f.input :amount_earned
			f.input :owes_money
			f.input :has_paid
			f.input :has_referred
			f.input :status
			f.input :future_followup, as: :datepicker
		end
		f.actions
	end



  	scope :all, default: true
  	scope :my_tickets do |tickets|
  		tickets.where("admin_user_id = ?", current_admin_user.id)
  	end
  	scope :my_tix_to_call do |tickets|
  		tickets.where("admin_user_id = ?", current_admin_user.id).where(has_bill: true).where(call_complete: false).where(gave_consent: true).where(summary_email_sent: false)
  	end

  	index do
		selectable_column
		column("TID", :sortable => :id) {|ticket| link_to "##{ticket.id} ", admin_ticket_path(ticket) }
	    # column("State")                   {|ticket| status_tag(ticket.state) }
	  	column("Customer Name") {|ticket| ticket.customer.first_name}
	  	column("Email") {|ticket| ticket.customer.email }
	    column("Has Bill", :has_bill)
	    column("Gave Consent", :gave_consent)
	    column("Call Done", :call_complete)
	    column("Saved $", :successfully_saved_money)
	    column("Paid", :has_paid)
	    column("Referred") {|ticket| ticket.customer.referred_by}
	    column("Owner", :admin_user_id)
	    
	end

	signer = Aws::S3::Presigner.new
 	

	show title: proc{|ticket| "#{ticket.customer.first_name}'s ticket" } do
		panel "Signup Info" do
			attributes_table_for ticket  do
				row :saver_guest_id
				row :admin_user_id
				row :has_bill
				row :has_phone
				row :gave_consent
			end
		end
		
		panel "Ticket Outcome" do
			attributes_table_for ticket do
				row :call_complete
				row :summary_email_sent
				row	:successfully_saved_money
				row("Amount Saved") { |ticket| monetize(ticket.amount_saved)}
				row("Amount Earned") { |ticket| monetize(ticket.amount_earned)}
				row :owes_money
				row :has_paid
				row :has_referred
				row :status
				row :future_followup
			end
		end		

		panel "Bill Information" do
			attributes_table_for ticket do
				row :service_provider
				row :zip_code
				row("Old monthly rate") { |ticket| monetize(ticket.old_monthly_rate)}
				row :tv_service
				row :internet_service
				row :phone_service
				row ("Bill") do |ticket|
					if ticket.bill_key
						key = signer.presigned_url(:get_object, bucket: ENV['S3_BUCKET'], key: "#{ticket.bill_key}")
						%{<iframe src="#{key}" width="800" height="600"></iframe>}.html_safe
					end
				end
			end
		end
		
	end

	sidebar :customer_or_saver_guest, only: [:show, :edit] do
		if resource.saver_guest
			ul do
				li link_to "#{resource.saver_guest.name}", admin_saver_guest_path(resource.saver_guest)
				li "#{resource.saver_guest.email}"
				li "Created on #{resource.saver_guest.created_at}"
			end
		else
			ul do
				li link_to "#{resource.customer.first_name}", admin_customer_path(resource.customer)
				li "#{resource.customer.email}"
				li "Created on #{resource.customer.created_at}"
			end
		end
	end

	sidebar :calls, only: :show do
		ul do
			resource.calls.each do |call|			
				li link_to "Call with #{call.agent_name}", admin_call_path(call)
			end
		end
		link_to "New Call", new_admin_call_path(call: {ticket_id: resource})
	end


end
