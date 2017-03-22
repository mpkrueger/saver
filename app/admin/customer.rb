ActiveAdmin.register Customer do

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
	permit_params :first_name, :email, :password, :referred_by, :invite_url_param


	index do
		selectable_column
			column("TID", :sortable => :id) {|customer| link_to "##{customer.id} ", admin_customer_path(customer) }
	  	column("Customer Name") {|customer| customer.first_name}
	  	column("Email") {|customer| customer.email }
	    column("Latest ticket") {|customer| customer.tickets.last}
	    
	end

end
