class IntroController < ApplicationController
  include Wicked::Wizard

  steps :student_loans_info, :credit_cards, :savings, :investments, :spending, 
  :future, :present_vs_future, :financial_score

  def show
  	@user = current_user
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
      future_day: [:city, 
                   :reason, 
                   :company,
                   :role,
                   :after_work,
                   :weekends,
                   :financially])
  end
end
