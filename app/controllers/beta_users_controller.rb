class BetaUsersController < ApplicationController
  def new
  	@beta_user = BetaUser.new
  end

  def create
  	@beta_user = BetaUser.new(params.require(:beta_user).permit(:first_name, :email))
  	if @beta_user.save
  		BetaMailer.beta_intro(@beta_user).deliver
  		redirect_to goals_thanks_path
  	else
  		flash[:error] = "Uh oh, that didn't work - please try again"
  	end
  end
end
