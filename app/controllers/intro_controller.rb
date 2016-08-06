class IntroController < ApplicationController
  include Wicked::Wizard

  steps :student_loans_info, :credit_cards, :savings, :investments, :spending, 
  :future, :present_vs_future, :financial_score, :thanks

  def show
  	@user = current_user
    @savvy_score = @user.savvy_score
    @debt_score_percent = @user.debt_score_percent
    @savings_score_percent = @user.savings_score_percent
    @investments_score_percent = @user.investments_score_percent
    @savings_habits_percent = @user.savings_habits_percent
    @investment_habits_percent = @user.investment_habits_percent
    @financial_awareness_percent = @user.financial_awareness_percent
    @future_preparedness_percent = @user.future_preparedness_percent
  	render_wizard
  end

  def update
  	@user = current_user
    @user.update_attributes(user_params)
  	render_wizard @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :student_loans, :student_amount, :cc_debt, 
      :cc_amount, :savings, :savings_amount, :investments, :spend_vs_income, 
      :preparedness, :email, :financial_score, investments_type: [:retirement_fund, :company_stock, :stock_market, :beanie_babies],
      future_day: [:gender,
                   :city, 
                   :reason, 
                   :company,
                   :role,
                   :after_work,
                   :weekends,
                   :financially])
  end
end
