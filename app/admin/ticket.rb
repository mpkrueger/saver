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

	permit_params :admin_user_id, :has_bill, :has_phone, :call_complete, :summary_email_sent, :successfully_saved_money, :amount_saved, :owes_money, :has_paid, :has_referred, :status
	
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

end
