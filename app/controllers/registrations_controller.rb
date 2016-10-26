class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
	  @guest_user = guest_user
	  build_resource(sign_up_params)

	  resource.name = @guest_user.name
	  resource.age = @guest_user.age
	  resource.guest_user_id = @guest_user.id

	  resource.investing_profile = InvestingProfile.new
	  resource.investing_profile.explain_stocks_vs_funds = @guest_user.explain_stocks_vs_funds
	  resource.investing_profile.worry_about_risks = @guest_user.worry_about_risks
	  resource.investing_profile.curious_about_access_to_money = @guest_user.curious_about_access_to_money
	  resource.investing_profile.remaining_concerns_about_access = @guest_user.remaining_concerns_about_access
	  resource.investing_profile.investment_goal = @guest_user.investment_goal
	  resource.investing_profile.post_investment_goal = @guest_user.post_investment_goal
	  resource.investing_profile.knows_amount_to_invest = @guest_user.knows_amount_to_invest
	  resource.investing_profile.amount_wants_to_invest = @guest_user.amount_wants_to_invest
	  resource.investing_profile.amount_to_get_started = @guest_user.amount_to_get_started
	  resource.investing_profile.has_retirement_account = @guest_user.has_retirement_account
	  resource.investing_profile.has_invested_before = @guest_user.has_invested_before
	  resource.investing_profile.explain_diversification = @guest_user.explain_diversification
	  resource.investing_profile.has_these_types_of_debt = @guest_user.has_these_types_of_debt
	  resource.investing_profile.questions = @guest_user.questions
	  resource.investing_profile.concerns_about_risks = @guest_user.concerns_about_risks

	  
	  resource.save

	  yield resource if block_given?

	  if resource.persisted?
      	if resource.active_for_authentication?
	        set_flash_message! :notice, :signed_up
	        sign_up(resource_name, resource)
	        BetaMailer.beta_intro(resource).deliver
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
		services_welcome_path
	end

	def after_update_path_for(resource)
		root_path
	end

	protected

	def update_resource(resource, params)
    	resource.update_without_password(params)
  	end

  	def sign_up_params
    	params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  	end

  	def account_update_params
    	params.require(:user).permit(:email, :phone_number, :password, :password_confirmation, :current_password, :chat_type, :contact_prefs)
  	end
end