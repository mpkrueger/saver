class IntroController < ApplicationController
  include Wicked::Wizard

  steps :student_loans_info, :credit_cards, :savings, :investments, :spending, 
  :present_day, :future, :present_vs_future, :financial_score

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
    params.require(:user).permit(:name, :age, :student_loans, :student_amount, :cc_debt, :cc_amount, :savings, :savings_amount, :investments, :investments_type, :spend_vs_income, :present_day, :future_day, :financial_score)
  end
end
