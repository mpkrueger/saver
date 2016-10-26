class InvestingProfilesController < ApplicationController
	def new
		@investing_profile = InvestingProfile.new
	end

	def create
		@user = current_user
		@investing_profile = InvestingProfile.new(investing_profile_params)
		@investing_profile.user = @user

		if @investing_profile.save
			redirect_to next_wizard_path
		else
			flash[:error] = "uh oh"
			redirect_to root
		end
	end

	def update
		@user = current_user
		@investing_profile = @user.investing_profile
		if @investing_profile.update_attributes(investing_profile_params)
			redirect_to dashboard_invested_thanks_path
		else
			redirect_to root_path
		end
	end

	private

	def investing_profile_params
		params.require(:investing_profile).permit(:explain_stocks_vs_funds, :explain_diversification, :worry_about_risks, 
      :concerns_about_risks, :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_invest, :amount_to_get_started, :has_retirement_account, 
      :has_invested_before, :questions, :follow_up_prefs, :investment_service, :invested_amount, :investing_experience, :investing_better,  
      has_these_types_of_debt: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none])
	end
end
