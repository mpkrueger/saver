class FinProfilesController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def update
    @user = current_user
    @fin_profile = @user.fin_profile
    @area_to_work_on = @user.fin_profile.area_to_work_on

    if @fin_profile.update_attributes(params.require(:fin_profile).permit(:cc_feeling, :cc_approach, :cc_rate, :cc_amount, :student_feeling, :student_approach, :student_rate, :student_amount))
      	case @area_to_work_on
		when "SAVINGS HABITS", "SAVINGS"
			redirect_to challenges_saving_model_path
		when "STUDENT LOANS"
			redirect_to challenges_student_loan_model_path
		when "CREDIT CARD DEBT"
			redirect_to challenges_credit_card_model_path
		when "INVESTMENTS"
			redirect_to challenges_investment_model_path
		end
    else
      flash[:error] = "Uh oh, that didn't work - please try again"
      render root_path
    end
  end
end
