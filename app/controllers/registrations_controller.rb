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
	  resource.guest_user_id = @guest_user.id

	  resource.fin_profile = FinProfile.new
	  resource.fin_profile.savvy_feel = @guest_user.savvy_feel
	  resource.fin_profile.student_amount = @guest_user.student_amount
	  resource.fin_profile.student_attitude = @guest_user.student_attitude
	  resource.fin_profile.cc_amount = @guest_user.cc_amount
	  resource.fin_profile.cc_attitude = @guest_user.cc_attitude
	  resource.fin_profile.spend_less = @guest_user.spend_less
	  resource.fin_profile.savings_amount = @guest_user.savings_amount
	  resource.fin_profile.investments_type = @guest_user.investments_type
	  resource.fin_profile.savings_from_income = @guest_user.savings_from_income
	  resource.fin_profile.future_day = @guest_user.future_day
	  resource.fin_profile.preparedness = @guest_user.preparedness
	  resource.fin_profile.current_focus = @guest_user.current_focus
	  
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
		@user = current_user
		if @user.fin_profile.cc_attitude == "get some advice" || @user.fin_profile.cc_attitude == "continue what I\'m doing"
			challenges_lets_chat_path
		elsif @user.fin_profile.spend_less == "no" && @user.fin_profile.current_focus != "INVESTMENTS"
			challenges_lets_chat_path
		else
			challenges_intro_path
		end
	end

	def after_update_path_for(resource)
		root_path
	end

	protected

	def update_resource(resource, params)
    	resource.update_without_password(params)
  	end

  	def sign_up_params
    	params.require(:user).permit(:email, :phone_number, :password, :password_confirmation)
  	end

  	def account_update_params
    	params.require(:user).permit(:email, :phone_number, :password, :password_confirmation, :current_password, :chat_type, :contact_prefs)
  	end
end
