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

end
