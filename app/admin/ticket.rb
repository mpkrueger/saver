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

	permit_params :admin_user_id, :has_bill, :has_phone, :gave_consent, :call_complete, :summary_email_sent, :successfully_saved_money, :amount_saved, :owes_money, :has_paid, :has_referred, :status, :future_followup
	
	controller do
		belongs_to :saver_guest, :admin_user, optional: true
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
		column("Ticket", :sortable => :id) {|ticket| link_to "##{ticket.id} ", admin_ticket_path(ticket) }
	    # column("State")                   {|ticket| status_tag(ticket.state) }
	    column("Has Bill", :has_bill)
	    column("Gave Consent", :gave_consent)
	    column("Call Complete", :call_complete)
	    column("Saved Money", :successfully_saved_money)
	    column("Paid", :has_paid)
	    column("Assigned to", :admin_user_id)
	    
	end

end
