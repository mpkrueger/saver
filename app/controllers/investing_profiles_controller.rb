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
	end

	private

	def investing_profile_params
		params.require(:investing_profile).permit(:explain_stocks_vs_funds, :explain_diversification, :worry_about_risks,
			:curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
			:knows_amount_to_invest, :amount_wants_to_invest, :amount_to_get_started, :has_retirement_account, :has_invested_before, 
			:has_these_types_of_debt)
	end
end
