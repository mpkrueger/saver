class SavvyScoreUser < ApplicationRecord

	def student_debt_score_percent 
		self.student_debt_score / 10.0 * 100
	end

	def cc_debt_score_percent
		self.cc_debt_score / 10.0 * 100
	end

	def personal_loan_percent
		self.personal_loan_score / 10.0 * 100
	end

	def savings_score_percent
		self.savings_score / 20.0 * 100
	end

	def investments_score_percent
		self.investments_score / 20.0 * 100
	end

	def spending_habit_percent
		self.spending_habit_score / 30.0 * 100
	end


##
# For the Savvy Score, here's how the scoring currently breaks down:
# - Debt score = 30 points (combines student loans, credit cards, and personal loans)
# - Savings score = 20 points
# - Investments score = 20 points
# - Spending Habits score = 30 points
##

	def student_debt_score
		student_debt = 10

		case self.debt_types["student_debt"]
			when 0
				student_debt -= 1
			when 1
				student_debt -= 2
			when 2
				student_debt -= 4
			when 3
				student_debt -= 6
		end

		student_debt
	end

	def cc_debt_score
		cc_debt = 10

		case self.debt_types["credit_card_debt"]
			when 1
				cc_debt -= 6
			when 2
				cc_debt -= 8
			when 3
				cc_debt -= 10
		end

		cc_debt
	end

	def personal_loan_score
		personal_loans = 10
		# high interest
		if(self.debt_types["personal_loans"]  == 2) 
			case self.personal_loan_amount
				when 0
					personal_loans -= 6
				when 1
					personal_loans -= 8
				when 2
					personal_loans -= 10
			end
		#low interest
		elsif(self.debt_types["personal_loans"]  == 1)
			case self.personal_loan_amount
				when 0
					personal_loans -= 2
				when 1
					personal_loans -= 4
				when 2
					personal_loans -= 6
			end
		#I don't know
		elsif(self.debt_types["personal_loans"]  == 3)
			personal_loans = 0
		end

		personal_loans

	end


	def savings_score
		savings = 0

		case self.savings_amount
			when "0" #piggybank raid
				savings = 0
			when "1" #hundreds
				savings = 5
			when "2" #thousands
				savings = 15
			when "3" #tens of thousands
				savings = 20
			when "4" #I don't know
				savings = 0
		end

		savings
	end

	def investments_score
		investments = 20
		if self.investment_types != nil
			if self.investment_types["retirement_fund"] == "0"
				investments -= 10

				if self.investment_types["indiv_stocks"] == "1"
					investments += 2
				end

				if self.investment_types["real_estate"] == "1"
					investments += 2
				end

			end

			if self.investment_types["stock_funds"] == "0"
				investments -= 6

				if self.investment_types["retirement_fund"] == "1"

					if self.investment_types["indiv_stocks"] == "1"
						investments += 2
					end

					if self.investment_types["real_estate"] == "1"
						investments += 2
					end
					
				end

			end

		end

		investments
	end


	def spending_habit_score
		spending_habit = 0

		case self.spending_habit
			when "all"
				spending_habit = 0
			when "some"
				spending_habit += 15
			when "only a little"
				spending_habit += 30
			when "beats me"
				spending_habit = 0
		end

		spending_habit
	end


	def savvy_score

		student_debt = self.student_debt_score
		cc_debt = self.cc_debt_score
		personal_loans = self.personal_loan_score
		savings = self.savings_score
		investments = self.investments_score
		spending_habit = self.spending_habit_score

		financial_score = student_debt + cc_debt + personal_loans + savings + investments + spending_habit
	end



end
