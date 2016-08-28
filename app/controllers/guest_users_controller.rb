class GuestUsersController < ApplicationController
  def new
  end

  def create
    @guest_user = GuestUser.new(guest_user_params)
    
    if @guest_user.save
      session[:guest_user_id] = @guest_user.id
      redirect_to intro_index_path
    else
      flash[:error] = "uh oh"
      redirect_to root
    end
  end

  def update
    @guest_user = guest_user
    @current_focus = @guest_user.current_focus

    if @guest_user.update_attributes(params.require(:guest_user).permit(:current_focus))
      redirect_to new_user_registration_path
    else
      flash[:error] = "Uh oh, that didn't work - please try again"
      render goals_new_focus_path
    end
  end

  private

  def guest_user_params
    params.require(:guest_user).permit(:name, :age)
  end
end
