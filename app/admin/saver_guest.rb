ActiveAdmin.register SaverGuest do

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
	sidebar "Customer's bills", only: [:show, :edit] do
  	resource.tickets.each do |ticket|	
      ticket.bills.each do |bill|
      		ul do
        			li link_to "Cable or Internet Bill",    admin_ticket_bills_path(ticket, bill)
      		end
    		end
      end

  	end

  	sidebar "Customer's tickets", only: [:show, :edit] do
		resource.tickets.each do |ticket|
    		ul do
      			li link_to "Ticket",    admin_ticket_path(ticket)
    		end
  		end

  	end

end
