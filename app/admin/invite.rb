ActiveAdmin.register Invite do

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

	controller do
		belongs_to :customer, optional: true
	end

	index do
		selectable_column
		column("Invite ID", :sortable => :id) {|invite| link_to "##{invite.id} ", admin_invite_path(invite) }
	    # column("State")                   {|ticket| status_tag(ticket.state) }
	  	column("Sender Name") {|invite| invite.customer.first_name}
	  	column("Sender Email") {|invite| invite.customer.email }
	  	column("Receiver Email") {|invite| invite.receiver_email }
	    column "Receiver Customer" do |invite|
	    	if Customer.find_by_email(invite.receiver_email)
	      		link_to "#{Customer.find_by_email(invite.receiver_email).first_name} ", admin_customer_path(Customer.find_by_email(invite.receiver_email))
	      	else
	      		"No customer yet"
	      	end
	    end
	    
	end

end
