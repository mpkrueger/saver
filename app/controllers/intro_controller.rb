class IntroController < ApplicationController
  include Wicked::Wizard

  steps :savvy_feel, :future, :future_reflection, :financial_picture, :student_loans, :credit_cards, :savings_habits, :savings, :investments, 
   :savvy_score_explained, :financial_summary, :focus_area

  def show
  	@guest_user = guest_user
    @savvy_score = @guest_user.savvy_score
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
    params.require(:guest_user).permit(:name, :age, :savvy_feel, :student_loans, :student_amount, :student_attitude, :cc_attitude, 
      :cc_amount, :spend_vs_income, :spend_less, :savings_amount, :investments,  
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
