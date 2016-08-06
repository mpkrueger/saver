class User < ApplicationRecord

	validates :name, :age, presence: true

	def debt_score
		debt = 20

		case self.student_amount
		when 1
			debt -= 3
		when 2
			debt -= 6
		when 3
			debt -= 9
		end

		case self.cc_amount
		when 1
			debt -= 3
		when 2
			debt -= 6
		when 3
			debt -= 9
		end

		debt
	end

	def savings_score
		savings = 20

		case self.savings_amount
		when 0
			savings -=20
		when 1
			savings -= 10
		when 2
			savings -= 5
		end

		savings
	end

	def investments_score
		investments = 0
		if self.investments_type["retirement_fund"] == "1"
			investments += 10
		end

		if self.investments_type["company_stock"] == "1"
			investments += 3
		end

		if self.investments_type["stock_market"] == "1"
			investments += 7
		end

		investments
	end

	def savings_habits
		savings_habits = 0

		case self.spend_vs_income
		when "More than a third"
			savings_habits += 15
		when "Not much, if any"
			savings_habits += 5
		when "I'm in the red"
			savings_habits += 0
		end

		savings_habits
	end


	def savvy_score
		debt = self.debt_score
		savings = self.savings_score
		investments = self.investments_score
		savings_habits = self.savings_habits
		investment_habits = 5
		financial_awareness = 10
		proximity_to_future_self = 10

		financial_score = debt + savings + investments + savings_habits + investment_habits + financial_awareness + proximity_to_future_self
	end

	def update
	end

	
end
