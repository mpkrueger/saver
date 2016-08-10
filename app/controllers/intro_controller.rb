class IntroController < ApplicationController
  include Wicked::Wizard

  steps :student_loans_info, :credit_cards, :savings, :investments, :spending, 
  :future, :future_reflection, :financial_summary

  def show
  	@guest_user = guest_user
    @savvy_score = @guest_user.savvy_score
    @debt_score_percent = @guest_user.debt_score_percent
    @savings_score_percent = @guest_user.savings_score_percent
    @investments_score_percent = @guest_user.investments_score_percent
    @savings_habits_percent = @guest_user.savings_habits_percent
    @investment_habits_percent = @guest_user.investment_habits_percent
    @financial_awareness_percent = @guest_user.financial_awareness_percent
    @future_preparedness_percent = @guest_user.future_preparedness_percent
    @strength = @guest_user.strength
    @area_to_work_on = @guest_user.area_to_work_on
  	render_wizard
  end

  def update
  	@guest_user = guest_user
    @guest_user.update_attributes(guest_user_params)
  	render_wizard @guest_user
  end

  private

  def guest_user_params
    params.require(:guest_user).permit(:name, :age, :student_loans, :student_amount, :cc_debt, 
      :cc_amount, :savings, :savings_amount, :investments, :spend_vs_income, 
      :preparedness, :email, :financial_score, :financial_help, investments_type: [:retirement_fund, :company_stock, :stock_market, :beanie_babies],
      future_day: [:gender,
                   :city, 
                   :home, 
                   :living_with,
                   :company,
                   :responsibilities,
                   :lunch,
                   :evenings,
                   :major_goal])
  end
end
