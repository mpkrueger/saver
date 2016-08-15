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
    @current_focus = @user.fin_profile.current_focus

    if @fin_profile.update_attributes(params.require(:fin_profile).permit(:cc_feeling, :cc_approach, :cc_rate, :cc_amount, :biggest_expense, :expense_frequency, :student_feeling, :student_approach, :student_rate, :student_amount))
      	case @current_focus
    		when "SAVINGS HABITS", "SAVINGS"
    			redirect_to challenges_saving_model_path
    		when "STUDENT LOANS"
    			redirect_to challenges_student_loan_model_path
    		when "CREDIT CARD DEBT"
          if(@fin_profile.biggest_expense == nil)
    			 redirect_to challenges_credit_card_model_path
          else
            redirect_to challenges_get_started_path
          end
    		when "INVESTMENTS"
    			redirect_to challenges_investment_model_path
		    end
    else
      flash[:error] = "Uh oh, that didn't work - please try again"
      render root_path
    end
  end
end
