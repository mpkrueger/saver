class SavvyScoreUsersController < ApplicationController
	def new
	end

	def create
		@savvy_score_user = SavvyScoreUser.new(savvy_score_user_params)
		if @savvy_score_user.save
			session[:savvy_score_user_id] = @savvy_score_user.id
			redirect_to savvy_score_index_path
		else
			flash[:error] = "uh oh"
			redirect_to root_path
		end
	end

	def update
		
	end

	private

	def savvy_score_user_params
		params.require(:savvy_score_user).permit(:name, :age, :savvy_feel, 
        :cc_amount, :cc_approach, :student_loan_amount, :student_loan_approach, 
        :personal_loan_amount, :savings_amount, :spending_habit, :investment_types, :debt_question, 
        :savings_question, :investment_question, :spending_question, 
        debt_types: [:student_debt, :car_loans, :mortgage_loans, :personal_loans, :credit_card_debt, :none],
        investment_types: [:retirement_funds, :stock_funds, :indiv_stocks, :real_estate, :none])
	end
end
