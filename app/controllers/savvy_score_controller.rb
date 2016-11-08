class SavvyScoreController < ApplicationController
  include Wicked::Wizard

  steps :debt, :debt_followup, :savings_total, :spending_habits, :investments, :investments_followup, :final_summary



  def show
    
    @savvy_score_user = SavvyScoreUser.find_by_id(session[:savvy_score_user_id])
    
    render_wizard
  end

  def update
    @savvy_score_user = SavvyScoreUser.find_by_id(session[:savvy_score_user_id])
    @savvy_score_user.update_attributes(savvy_score_user_params)
    render_wizard @savvy_score_user
  end


  def credit_cards
  end

  def student_loans
  end

  def savings_total
  end

  def savings_habits
  end

  def investments
  end

  def intro_outline
  end

  def final_summary
  end

  def savvy_score_user_params
    params.require(:savvy_score_user).permit(:name, :age, :savvy_feel, 
        :cc_amount, :cc_approach, :student_loan_amount, :student_loan_approach, 
        :personal_loan_amount, :savings_amount, :spending_habit, :debt_question, 
        :savings_question, :investment_question, :spending_question, 
        debt_types: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none],
        investment_types: [:retirement_funds, :stock_funds, :indiv_stocks, :real_estate, :none])
  end
end
