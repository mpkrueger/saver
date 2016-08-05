class User < ApplicationRecord

	validates :name, :age, presence: true

	serialize :spend_vs_income
	serialize :present_day

	
	def savvy_score
		debt = 20
		savings = 20
		investments = 20
		savings_habits = 15
		investment_habits = 5
		financial_awareness = 10
		proximity_to_future_self = 10
	end

	
end
