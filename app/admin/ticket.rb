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

	permit_params :has_bill, :has_phone, :call_complete, :summary_email_sent, :successfully_saved_money, :amount_saved, :owes_money, :has_paid, :has_referred, :status
	belongs_to :saver_guest, optional: true

	sidebar "Bill", only: [:show, :edit] do
		resource.bills.each do |bill|
			ul do
	  			li link_to "Cable or Internet Bill",    admin_ticket_bills_path(resource, bill)
			end
		end

  	end

end
