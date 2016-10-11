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
    @investing_profile.update_attributes(user_params)
  	render_wizard @guest_user
  end

  private

  def investing_profile_params
    params.require(:user).permit(:name, :age, :savvy_feel, :student_loans, :student_amount, :student_attitude, :cc_attitude, 
      :cc_amount, :savings_from_income, :spend_less, :savings_amount, :investments, :current_focus, 
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
