class DashboardController < ApplicationController
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
		@savvy_score = @user.savvy_score
		@area_to_work_on = @user.area_to_work_on
	end
end
