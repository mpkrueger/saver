class DashboardController < ApplicationController
  def index
  end

  def thanks
  	@user = guest_user
  	@feedback = Feedback.new
  end
end
