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
		resource.bills.each do |bill|
    		ul do
      			li link_to "Cable or Internet Bill",    admin_saver_guest_bill_path(resource, bill)
    		end
  		end

  	end

end
