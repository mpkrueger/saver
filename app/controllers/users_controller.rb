class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.new(params.require(:user).permit(:why_here, :money_feels))

  	if @user.save
  		flash[:notice] = "User created and saved"
  		redirect_to intro_index_path
  	else
  		flash[:error] = "uh oh"
  		redirect_to root
  	end
  end

  def show
  end

  def edit
  end
end
