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
end
