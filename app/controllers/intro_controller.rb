class IntroController < ApplicationController
  include Wicked::Wizard

  steps :savvy_feel, :future, :future_reflection, :financial_picture, :student_loans, :credit_cards, :savings_habits, :savings, :investments, 
   :savvy_score_explained, :financial_summary, :focus_area

  def show
    @user = current_user
  	render_wizard
  end

  def update
  	@user = current_user
    @investing_profile = @user.investing_profile
    @investing_profile.update_attributes(investing_profile_params)
  	render_wizard @guest_user
  end

  private

  def investing_profile_params
    params.require(:investing_profile).permit(:explain_stocks_vs_funds, :knows_diversification, :worry_about_risks,
      :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_get_started, :has_retirement_account, :has_invested_before, 
      :has_these_types_of_debt)
  end
end
