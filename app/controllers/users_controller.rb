class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.new(params.require(:user).permit(:name, :age))

  	if @user.save
  		flash[:notice] = "User created and saved"
  		redirect_to intro_index_path(@user)
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
