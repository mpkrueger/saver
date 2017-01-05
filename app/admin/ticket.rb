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

	permit_params :admin_user_id, :saver_guest_id, :has_bill, :has_phone, :gave_consent, :call_complete, :summary_email_sent, :successfully_saved_money, :amount_saved, :owes_money, :has_paid, :has_referred, :status, :future_followup
	
	config.per_page = 100

	controller do
		belongs_to :saver_guest, :admin_user, optional: true
	end

	batch_action :assign, form: -> { {admin_user_id: AdminUser.pluck(:email, :id)}} do |ids, inputs|
		tickets = Ticket.find(ids)
		tickets.each do |ticket|
			ticket.update_attributes(admin_user_id: inputs["admin_user_id"])
		end
		redirect_to collection_path, notice: inputs.to_s
	end

	form do |f|
		inputs 'Change ticket status' do
			f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|admin_user| [admin_user.email, admin_user.id]}
			f.input :has_bill
			f.input :has_phone
			f.input :gave_consent
			f.input :call_complete
			f.input :summary_email_sent
			f.input :successfully_saved_money
			f.input :amount_saved
			f.input :owes_money
			f.input :has_paid
			f.input :has_referred
			f.input :status
			f.input :future_followup, as: :datepicker
			f.input :saver_guest_id, as: :select, collection: SaverGuest.all.collect {|saver| [saver.email, saver.id]}
		end
		f.actions
	end



	sidebar "Bill", only: [:show, :edit] do
		resource.bills.each do |bill|
			ul do
	  			li link_to "Cable or Internet Bill",    admin_ticket_bills_path(resource, bill)
			end
		end

  	end

  	scope :all, default: true
  	scope :my_tickets do |tickets|
  		tickets.where("admin_user_id = ?", current_admin_user.id)
  	end
  	scope :my_tix_to_call do |tickets|
  		tickets.where("admin_user_id = ?", current_admin_user.id).where(has_bill: true).where(call_complete: false).where(gave_consent: true)
  	end

  	index do
		selectable_column
		column("Ticket", :sortable => :id) {|ticket| link_to "##{ticket.id} ", admin_ticket_path(ticket) }
	    # column("State")                   {|ticket| status_tag(ticket.state) }
	  	column("Customer Name") {|ticket| ticket.saver_guest.name}
	    column("Has Bill", :has_bill)
	    column("Gave Consent", :gave_consent)
	    column("Call Complete", :call_complete)
	    column("Saved Money", :successfully_saved_money)
	    column("Paid", :has_paid)
	    column("Assigned to", :admin_user_id)
	    
	end

	show title: proc{|ticket| "#{ticket.saver_guest.name}'s ticket" }

	sidebar :saver_guest, only: [:show, :edit] do
		ul do
			li link_to "#{resource.saver_guest.name}", admin_saver_guest_path(resource.saver_guest)
			li "#{resource.saver_guest.email}"
			li "Created on #{resource.saver_guest.created_at}"
		end
	end


end
