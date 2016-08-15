class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def thanks
  	@user = guest_user
  	@feedback = Feedback.new
  end

  def final
  	@user = guest_user
  end

  def homepage
		@user = current_user
		@savvy_score = @user.fin_profile.savvy_score
		@current_focus = @user.fin_profile.current_focus
	end

  def update
    @user = current_user
    @fin_profile = @user.fin_profile

    if @fin_profile.update_attributes(params.require(:fin_profile).permit(:cc_feeling, :cc_approach, :cc_rate, :cc_amount, :student_feeling, :student_approach, :student_rate, :student_amount))
      redirect_to next_step
    else
      flash[:error] = "Uh oh, that didn't work - please try again"
      render root_path
    end
  end
end
