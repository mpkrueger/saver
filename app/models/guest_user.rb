class GuestUser < ApplicationRecord
	
	validates :name, :age, presence: true

	def student_debt_score_percent 
		self.student_debt_score / 10.0 * 100
	end

	def cc_debt_score_percent
		self.cc_debt_score / 20.0 * 100
	end
	
	def savings_score_percent
		self.savings_score / 20.0 * 100
	end

	def investments_score_percent
		self.investments_score / 15.0 * 100
	end

	def spending_percent
		self.spending / 15.0 * 100
	end

	def financial_awareness_percent
		self.financial_awareness / 10.0 * 100
	end

	def future_preparedness_percent
		10 / 10.0 * 100
	end

##
# For the Savvy Score, here's how the scoring currently breaks down:
# - Debt score = 30 points (combines student loans and credit cards)
# - Savings score = 20 points
# - Investments score = 15 points
# - Spending score (how much person is saving of income) = 15 points
# - Financial awareness = 10 points
# - How close person is to their future goals (proximity) = 10 points 

	def student_debt_score
		student_debt = 10

		case self.student_amount
		when 0
			student_debt
		when 1
			student_debt -= 10
		end

		student_debt
	end

	def cc_debt_score
		cc_debt = 20

		case self.cc_amount
		when 1
			cc_debt -= 5
		when 2
			cc_debt -= 10
		when 3
			cc_debt -= 20
		end

		cc_debt
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
		if self.investments_type != nil
			if self.investments_type["retirement_fund"] == "1"
				investments += 8
			end

			if self.investments_type["company_stock"] == "1"
				investments += 2
			end

			if self.investments_type["stock_market"] == "1"
				investments += 5
			end
		end

		investments
	end

	def spending
		spending = 0

		case self.spend_vs_income
		when "very little"
			spending += 15
		when "some"
			spending += 10
		when "most"
			spending += 5
		when "all"
			spending += 0
		end

		spending
	end

	def financial_awareness
		awareness = 0

		case self.savvy_feel
		when 'Feels like a foreign language'
			awareness += 2
		when 'I know the basics, but get lost sometimes'
			awareness += 4
		when 'I\'m savvier than most'
			awareness += 7
		when 'I\'m a pro'
			awareness += 10
		end

		awareness			
	end

	def future_preparedness
		preparedness = 0

		case self.preparedness
		when "1"
			preparedness += 2
		when "2"
			preparedness += 4
		when "3"
			preparedness += 7
		when "4"
			preparedness += 10
		end

		if self.student_attitude == "I want to pay them off ASAP"
			preparedness -= 2
		end

		if preparedness < 0
			preparedness = 0
		end

		preparedness
	end


	def savvy_score
		student_debt = self.student_debt_score
		cc_debt = self.cc_debt_score
		savings = self.savings_score
		investments = self.investments_score
		spending = self.spending
		investment_habits = 5
		financial_awareness = self.financial_awareness
		future_preparedness = self.future_preparedness

		financial_score = student_debt + cc_debt + savings + investments + spending + financial_awareness + future_preparedness
	end

	def area_to_work_on
		ordered_percents = [self.student_debt_score_percent, self.cc_debt_score_percent, self.savings_score_percent, self.investments_score_percent, self.spending_percent]
		ordered_percents = ordered_percents.sort
		
		# identify the area with the lowest percentage of points
		area = ordered_percents.first

		# no investments would yield a zero percent -
		# but we don't want to tackle that if the person has debt or only very maginal savings
		# so we check if area equals investments and, if so, check to see whether we should bump debt or savings above it


		# check to see if the person has any credit card debt - if so make that the biggest priority
		if [1,2,3].include? self.cc_amount
			area = self.cc_debt_score_percent

		# then check to see if the person wants to pay off their student loans faster - if so make that the biggest priority
		elsif student_attitude == "I want to pay them off ASAP"
			area = self.student_debt_score_percent
		
		# then check if the person is spending everything they earn - if so, make that the biggest priority
		elsif self.spend_vs_income == "all"
			area = self.spending_percent

		# then check if savings amount equals zero - if so, make that the biggest priority
		elsif self.savings_score == 0
			area = self.savings_score_percent

		end


		case area
		when self.cc_debt_score_percent
			"CREDIT CARD DEBT"
		when self.student_debt_score_percent
			"STUDENT LOANS"
		when self.spending_percent
			"SPENDING HABITS"
		when self.savings_score_percent
			"SAVINGS"
		when self.investments_score_percent
			"INVESTMENTS"
		end
	end

	def update
	end


end
