class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.new(params.require(:user).permit(:name, :age))

  	if @user.save
  		flash[:notice] = "User created and saved"
      session[:current_user_id] = @user.id
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
