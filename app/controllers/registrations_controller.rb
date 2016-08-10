class RegistrationsController < Devise::RegistrationsController
	def new
		@guest_user = guest_user
		@area_to_work_on = @guest_user.area_to_work_on
		super
	end

	def create
	  @guest_user = GuestUser.find_by(id: session[:guest_user_id])
	  build_resource(sign_up_params)
	  resource.name = @guest_user.name
	  resource.age = @guest_user.age
	  resource.student_amount = @guest_user.student_amount
	  resource.cc_amount = @guest_user.cc_amount
	  resource.savings_amount = @guest_user.savings_amount
	  resource.investments_type = @guest_user.investments_type
	  resource.spend_vs_income = @guest_user.spend_vs_income
	  resource.future_day = @guest_user.future_day
	  resource.preparedness = @guest_user.preparedness
	  
	  resource.save

	  yield resource if block_given?

	  if resource.persisted?
      	if resource.active_for_authentication?
	        set_flash_message! :notice, :signed_up
	        sign_up(resource_name, resource)
	        respond_with resource, location: after_sign_up_path_for(resource)
	    else
	        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
	        expire_data_after_sign_in!
	        respond_with resource, location: after_inactive_sign_up_path_for(resource)
	    end
	  else
	    clean_up_passwords resource
	    set_minimum_password_length
	    respond_with resource
	  end
	end

	def after_sign_up_path_for(resource)
		dashboard_thanks_path
	end
end