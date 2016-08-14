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
		@area_to_work_on = @user.fin_profile.area_to_work_on
	end
end
