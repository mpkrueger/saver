ActiveAdmin.register Call do

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
	
	permit_params :start_time, :end_time, :agent_name, :new_monthly_rate, :courtesy_credit, :confirmation_number, :notes, :ticket_id

	controller do
		belongs_to :ticket, optional: true
	end

	form do |f|
		inputs 'New Call' do
			f.input :ticket, as: :select, collection: Ticket.all.collect {|ticket| [ticket.saver_guest.name, ticket.id]}
			f.input :start_time, as: :date_time_picker
			f.input :end_time, as: :date_time_picker
			f.input :agent_name
			f.input :new_monthly_rate
			f.input :courtesy_credit
			f.input :confirmation_number
			f.input :notes
		end
		f.actions
	end

	index do
		selectable_column
		column("Call ID", sortable: :id) {|call| link_to "##{call.id}", admin_call_path(call)}
		column("TID", :sortable => :id) {|call| link_to "##{call.ticket_id} ", admin_ticket_path(call.ticket) }
		column("Saver Guest Name") {|call| link_to "#{call.ticket.saver_guest.name}", admin_saver_guest_path(call.ticket.saver_guest)}
		column("Agent Name", :agent_name)
		column("Day of call") {|call| "#{call.start_time.strftime("%A, %b %d, %Y")}"}
	    # column("State")                   {|ticket| status_tag(ticket.state) }
	  	# column("Customer Name") {|ticket| ticket.saver_guest.name}
	  	# column("Email") {|ticket| ticket.saver_guest.email }
	   #  column("Has Bill", :has_bill)
	   #  column("Gave Consent", :gave_consent)
	   #  column("Call Done", :call_complete)
	   #  column("Saved $", :successfully_saved_money)
	   #  column("Paid", :has_paid)
	   #  column("Owner", :admin_user_id)
	end

	show do
		panel "Call info" do
			attributes_table_for call  do
				row :ticket
				row :start_time
				row :end_time
				row :agent_name
				row("New Monthly Rate") { |call| monetize(call.new_monthly_rate)}
				row("Courtesy Credit") { |call| monetize(call.courtesy_credit)}
				row :confirmation_number
				row :notes
			end
		end
	end
end
