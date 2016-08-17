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

    if @fin_profile.update_attributes(params.require(:fin_profile).permit(:cc_feeling, :cc_approach, :cc_rate, :cc_amount, :biggest_expense, :expense_frequency, :student_feeling, :student_approach, :student_rate, :student_amount, :saving_purpose, :saving_purpose_free_form))
      	case @current_focus
    		when "SAVINGS HABITS", "SAVINGS"
    			if(@fin_profile.saving_purpose == nil)
            redirect_to challenges_saving_model_path
          else
            redirect_to challenges_get_started_path
          end
    		when "STUDENT LOANS"
          if(@fin_profile.student_approach == 3 || @fin_profile.student_feeling == 3) 
            #user is lost either on their approach or their goal; maybe we can help
            redirect_to challenges_lets_chat_path

          elsif(@fin_profile.student_feeling == 0 && @fin_profile.student_approach == 0)
            #user is paying less than minimum & wants to continue paying < minimum; confusing to us
           redirect_to challenges_new_focus_path

          elsif(@fin_profile.student_approach == 0 && (@fin_profile.student_feeling == 1) || (@fin_profile.student_feeling == 2))
            #user is paying < minimum but wants to pay more
            redirect_to challenges_saving_info_path

          elsif(@fin_profile.student_feeling == 0 || @fin_profile.student_feeling == 1)
            #user wants to pay less than or equal to minimum 
            redirect_to challenges_new_focus_path

          elsif(@fin_profile.student_approach == 2 && @fin_profile.student_feeling == 2)
            #user is paying more than minimum and wants to pay off fast; may be complicated
            redirect_to challenges_saving_info_path
          end
    		
        when "CREDIT CARD DEBT"
          fif(@fin_profile.cc_approach == 3 || @fin_profile.cc_feeling == 2)
            #user is lost either on their approach or their goal; maybe we can help 
            redirect_to challenges_lets_chat_path

          elsif(@fin_profile.cc_feeling == 0)
            #user wants to continue what they're doing
            redirect_to challenges_new_focus_path

          elsif (@fin_profile.cc_feeling == 1)
            #user wants to pay debt off faster than they currently are
            redirect_to challenges_saving_info_path

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
