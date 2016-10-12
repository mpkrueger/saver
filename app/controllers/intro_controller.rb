class IntroController < ApplicationController
  include Wicked::Wizard

  steps :introduction, :ways_to_invest, :diversification, :risks, :access, :takeaways, 
  :investment_goal, :post_investment, :initial_investment, :retirement_account, :investment_experience, 
  :debt, :other_thoughts, :follow_up

  def show
    @user = current_user
    if @user.investing_profile != nil
      @investing_profile = @user.investing_profile
    else
      @investing_profile = InvestingProfile.new
    end
    render_wizard
  end

  def update
    @user = current_user
    @investing_profile = @user.investing_profile
    @investing_profile.update_attributes(investing_profile_params)
    render_wizard @investing_profile
  end

  private

  def investing_profile_params
    params.require(:investing_profile).permit(:explain_stocks_vs_funds, :explain_diversification, :worry_about_risks,
      :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_get_started, :has_retirement_account, :has_invested_before, 
      :has_these_types_of_debt)
  end
end