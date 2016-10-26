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
    params.require(:guest_user).permit(:name, :age, :explain_stocks_vs_funds, :explain_diversification, :worry_about_risks, 
      :concerns_about_risks, :curious_about_access_to_money, :remaining_concerns_about_access, :investment_goal, :post_investment_goal, 
      :knows_amount_to_invest, :amount_wants_to_invest, :amount_to_invest, :amount_to_get_started, :has_retirement_account, 
      :has_invested_before, :questions, :follow_up_prefs, 
      has_these_types_of_debt: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none])
  end
end
