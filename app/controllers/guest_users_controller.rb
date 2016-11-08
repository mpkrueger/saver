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
    if @guest_user.update_attributes(guest_user_params)
      redirect_to thanks_intro_index_path
    else
      redirect_to root_path
    end
  end

  private

  def guest_user_params
    params.require(:guest_user).permit(:name, :age, :savvy_feel, 
      :debt_types, :cc_amount, :cc_approach, :student_loan_amount, :student_loan_approach, 
      :personal_loan_amount, :savings_amount, :spending_habit, :investment_types, :debt_question, 
      :savings_question, :investment_question, :spending_question)
  end
end
