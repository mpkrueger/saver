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

  private

  def guest_user_params
    params.require(:guest_user).permit(:name, :age)
  end
end
