class SavvyScoreController < ApplicationController
  include Wicked::Wizard

  steps :student_loans, :credit_cards, :savings_total, :savings_habits, :investments, :final_summary

  def show
    @guest_user = guest_user
    
    render_wizard
  end

  def update
    @guest_user = guest_user
    @guest_user.update_attributes(guest_user_params)
    render_wizard @guest_user
  end

  def credit_cards
  end

  def student_loans
  end

  def savings_total
  end

  def savings_habits
  end

  def investments
  end

  def intro_outline
  end

  def final_summary
  end

  def guest_user_params
    params.require(:guest_user).permit(:explain_stocks_vs_funds, :explain_diversification, :worry_about_risks, 
      :concerns_about_risks, :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_invest, :amount_to_get_started, :has_retirement_account, 
      :has_invested_before, :previous_investment_service, :questions, :follow_up_prefs, 
      has_these_types_of_debt: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none])
  end

end
