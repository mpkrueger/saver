class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:notice] = "User created and saved"
      session[:current_user_id] = @user.id
  		redirect_to intro_index_path
  	else
  		flash[:error] = "uh oh"
  		redirect_to root
  	end
  end


  private

  def user_params
    params.require(:user).permit(:name, :age, :student_loans, :student_amount, :cc_debt, :cc_amount, :savings, :savings_amount, :investments, :investments_type, :spend_vs_income, :present_day, :future_day, :financial_score)
  end
end
