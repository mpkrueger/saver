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
    		when "SPENDING", "SAVINGS"
    			if(@fin_profile.saving_purpose == nil)
            redirect_to challenges_saving_model_path
          else
            redirect_to challenges_get_started_path
          end
    		when "STUDENT LOANS"
          
          if @fin_profile.biggest_expense == nil
            case @fin_profile.student_approach
            when "not sure", "more than the amount due"
              # user is either not sure how much they're paying or is already paying more than amount due - would be good to chat with them to find out more
              redirect_to challenges_lets_chat_path
            when "less than the amount due", "the amount due"
              # user has opportunity to pay more and accelerate repayment with saving challenge
              redirect_to challenges_saving_info_path
            end
          elsif @fin_profile.student_feeling == nil
            redirect_to challenges_loan_saving_model_path
          else
            redirect_to challenges_get_started_path
          end
    		
        when "CREDIT CARD DEBT"

          if(@fin_profile.biggest_expense == nil)
            
            if @fin_profile.cc_attitude == "get some help" || @fin_profile.cc_attitude == "continue what I\'m doing"
              #user said in the intro that they want to get some help with their cc debt or that they want to continue what they're doing; let's chat with them to see if we can help
              redirect_to challenges_lets_chat_path
            else
              case @fin_profile.cc_approach
              when "not sure", "less than the minimum due"
              #user is either lost on their approach or having bigger issues; maybe we can help best by chatting
              redirect_to challenges_lets_chat_path

              when "the minimum due", "more than the minimum due"
                #user wants to pay debt off faster than they currently are
                redirect_to challenges_saving_info_path
              end
            end

          elsif(@fin_profile.cc_feeling == nil)
              redirect_to challenges_loan_saving_model_path
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
