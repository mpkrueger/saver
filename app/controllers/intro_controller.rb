class IntroController < ApplicationController
  include Wicked::Wizard

  steps :introduction, :ways_to_invest, :diversification, :risks, :access, :takeaways, 
  :investment_goal, :post_investment, :initial_investment, :retirement_account, :investment_experience, 
  :debt, :other_thoughts

  def show
    @guest_user = guest_user
    
    render_wizard
  end

  def update
    @guest_user = guest_user
    @guest_user.update_attributes(guest_user_params)
    if @guest_user.amount_to_get_started != nil && @guest_user.amount_to_get_started > 4999 && @guest_user.has_retirement_account == nil
      redirect_to amount_check_intro_index_path
    else
      render_wizard @guest_user
    end
  end

  def amount_check
    @guest_user = guest_user
    @initial_amount = guest_user.amount_to_get_started
  end

  def follow_up
    @guest_user = guest_user
  end

  def thanks
    @guest_user = guest_user
  end

  def finish_wizard_path
    if @guest_user.has_these_types_of_debt["personal_loans"] == "1" || @guest_user.has_these_types_of_debt["credit_card_debt"] == "1"
      follow_up_intro_index_path
    elsif @guest_user.has_retirement_account == "No"
      follow_up_intro_index_path
    elsif @guest_user.concerns_about_risks != nil || @guest_user.remaining_concerns_about_access != nil || @guest_user.questions != ""
      follow_up_intro_index_path
    elsif @guest_user.investment_goal == "I need more money in the short-term and hope investing will help"
      follow_up_intro_index_path
    else
      new_user_registration_path
    end
  end

  private

  def guest_user_params
    params.require(:guest_user).permit(:explain_stocks_vs_funds, :explain_diversification, :worry_about_risks, 
      :concerns_about_risks, :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_invest, :amount_to_get_started, :has_retirement_account, 
      :has_invested_before, :previous_investment_service, :questions, :follow_up_prefs, 
      has_these_types_of_debt: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none])
  end
end