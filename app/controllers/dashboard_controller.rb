class DashboardController < ApplicationController
  def index
  end

  def thanks
  	@user = guest_user
  end
end
