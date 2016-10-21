class BetaUsersController < ApplicationController
  def new
  	@beta_user = BetaUser.new
  end

  def create
  	@beta_user = BetaUser.new(params.require(:beta_user).permit(:first_name, :email))
  	if @beta_user.save
  		BetaMailer.beta_intro(@beta_user).deliver
  		redirect_to goals_index_path(email: @beta_user.email)
  	else
  		flash[:error] = "Uh oh, that didn't work - please try again"
  	end
  end

  def update
    @beta_user = BetaUser.find_by_id(params[:id])
    @beta_user.update_attributes(params.require(:beta_user).permit(:start_or_remind))
    if @beta_user.start_or_remind.include? "start"
      redirect_to goals_index_path(email: @beta_user.email)
    else
      head :no_content
    end
  end
end
