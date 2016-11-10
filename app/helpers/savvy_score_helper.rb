module SavvyScoreHelper

	def savings_feedback
		@savvy_score_user = SavvyScoreUser.find_by_id(session[:savvy_score_user_id])
		case @savvy_score_user.savings_amount
		when 0
			"46\% of Americans wouldn’t be able to cover a sudden $400 expense so you’re not alone. We're happy to follow up with you to figure out how to build up some emergency savings."
		when 1
			"It’s generally good to have about 3-6 months worth of expenses saved up... just in case! We're happy to follow up with you to figure out how to build up your emergency savings."
		when 2, 3
			"That’s great, glad to hear you’re on the right track with savings."
		end
	end

	def spending_feedback
		@savvy_score_user = SavvyScoreUser.find_by_id(session[:savvy_score_user_id])
		case @savvy_score_user.spending_habit
		when 'all'
			"Cool, I understand there may not be any wiggle room in how much you spend and save each month. 
			We can talk later about other potential ways to tuck a little away each month."
		when 'some'
			"Cool, I understand there may not be much wiggle room in how much you spend and save each month.
			We can talk later about other potential ways to tuck extra away each month."
		when 'a little'
			"That's great, saving more than you spend is an awesome way to build up your wealth so you can have 
			financial freedom."
		end
	end

	def investment_feedback
		@savvy_score_user = SavvyScoreUser.find_by_id(session[:savvy_score_user_id])
		if (@savvy_score_user.investment_types['retirement_funds'] == '1')
			"Great that you've started investing for retirement!"
		elsif((@savvy_score_user.investment_types['stock_funds'] == '1') and (@savvy_score_user.investment_types['retirement_funds'] == '0'))
			"Great that you're doing some investing! You may want to consider investing in a retirement fund as well. We're happy to dive into this more later if you're interested."
		elsif((@savvy_score_user.investment_types['indiv_stocks'] == '1') and (@savvy_score_user.investment_types['retirement_funds'] == '0') and (@savvy_score_user.investment_types['stock_funds'] == '0'))
			"Great that you're doing some investing! You may want to consider opening a retirement account or investing in some index or mutual 
			funds. We're happy to dive into this more later if you're interested."
		elsif((@savvy_score_user.investment_types['real_estate'] == '1') and (@savvy_score_user.investment_types['retirement_funds'] == '0'))
			"Great that you've invested in real estate. You may want to consider investing in a retirement fund as well, 
			but we can talk more about that later."
		elsif(@savvy_score_user.investment_types['none'] == '1')
			"Investing can be intimidating. We'd be happy to help you get started if you're interested."
		else
			"Glad to hear you're doing some investing!"
		end
			
	end

	def savvy_score_thoughts
		if @savvy_score_user.savvy_score < 40
			"Let's get to work!"
		elsif @savvy_score_user.savvy_score < 75
			"Not bad!"
		elsif @savvy_score_user.savvy_score < 90
			"Pretty good!"
		else
			"Top-notch!"
		end
	end

	def debt_score_explanation
		message = ""
		cc_deduction = 10 - @savvy_score_user.cc_debt_score
		student_deduction = 10 - @savvy_score_user.student_debt_score
		personal_loan_deduction = 10 - @savvy_score_user.personal_loan_score
		total_deduction = cc_deduction + student_deduction + personal_loan_deduction

		if(total_deduction > 0) #debt
			# message += "Your debt score was lowered by " + total_deduction.to_s + " points because of your " 
			# if(cc_deduction > 0)
			# 	message += "credit card debt"
			# 	if (student_deduction > 0)
			# 		if(personal_loan_deduction > 0)
			# 			message += ", your student loans, and your personal loans.\n"
			# 		else
			# 			message += " and your student loans.\n"
			# 		end
			# 	else
			# 		message += ".\n"
			# 	end
			# elsif(student_deduction > 0)
			# 	if(personal_loan_deduction > 0)
			# 		message += "student loans and your personal loans.\n"
			# 	else
			# 		message += "student loans.\n"
			# 	end

			# elsif(personal_loan_deduction > 0)
			# 	message += "personal loans.\n"
			# end

		else #no debt (personal loans, cc debt, or student loans)
			message += "Sweet! You don't have any high-interest debt!"
		end

		if (cc_deduction > 0)
			message += "Credit Card Debt: -" + cc_deduction.to_s + " points\n"
			message += "We think credit cards are awesome, but their high interest rates can make your balance build up like a Katamari. "
		end
		if (student_deduction > 0)
			message += "Student Loans: -" + student_deduction.to_s + " points\n\n"
			if(student_deduction > 2)
				message += "Student loans tend to have low interest rates, but having more than $20k in debt can hold you back."
			elsif(student_deduction <= 2)
				message += "Fortunately student loans generally have low interest rates so they don't do too much damage."
			end
		end
		if (personal_loan_deduction > 0)
			message += "Personal loans: -" + personal_loan_deduction.to_s + " points" + "\n"
			if(@savvy_score_user.personal_loans_interest == "2")
				message += "Your personal loans have a high interest rate, which make your balance build up like a snowball."
			elsif(@savvy_score_user.personal_loans_interest == "1")
				message += "It's great that your personal loans have a low interest rate."
			end
		end
		message

	end

	def savings_score_explanation
		message = ""
		case (@savvy_score_user.savings_amount)
			when "0" #none
				message += "Piggy bank raids are the worst! We gotta get you some emergency savings to make sure you have an umbrella or an awning to duck under for those sudden downpours. "
			when "1" #hundreds
				message += "Let's work on getting those Benjamins to multiply until you have 3-6 months of expenses ready for an emergency."
			when "2" #thousands
				message += "Let's work on saving up until you've got 3-6 months of expenses ready for an emergency."
			when "3" #tens of thousands
				message += "Great work saving up!"
			when "4" #I don't know
				message += "Ok, first step – log into your bank account and check how much you've got. It'll take less than 5 minutes, we''re happy to wait. :)"
		end
	end

	def spending_habits_score_explanation
		message = ""
		case @savvy_score_user.spending_habit
			when "all"
				message += "It can be extremely hard to squirrel away a portion of each paycheck. But there may be small steps to take. Try this short exercise –  log into Mint.com or your bank account and look at your last month's transactions. Add up all of the expenses that you have to pay every month – like your rent, bills, etc. Subtract that from the amount you earn each month. With the amount remaining – think about if there's any area you could cut back, even $10 – is it food? entertainment? shopping?"
			when "some"
				message += "Good to hear you're squirreling a small portion away each month. Some recommend that you try to save 20% of each paycheck. That may not be possible, but it's worth doing a quick exercise to think about any areas you can cut back even a little. "
			when "only a little"
				message += "Awesome that you have such a good habit of saving!"
			when "beats me"
				message += "Do a short exercise – log into Mint.com or your bank account and look at your past transactions over the last 6 months. Figure out how much you've spent total relative to how much you've earned. That'll give you a sense for how well you're saving."
		end
	end

	def investments_score_explanation
		message = ""
		retirement_deduction = 0
		stock_fund_deduction = 0
		indiv_stock_addition = 0
		real_estate_addition = 0

		if (@savvy_score_user.investment_types["retirement_fund"] == "0")
			retirement_deduction = 12
		end
		if (@savvy_score_user.investment_types["stock_funds"] == "0")
			stock_fund_deduction = 8
		end
		if (@savvy_score_user.investment_types["indiv_stocks"] == "1" && (@savvy_score_user.investment_types["retirement_fund"] == "0" || @savvy_score_user.investment_types["stock_funds"] == "0"))
			indiv_stock_addition = 2
		end
		if (@savvy_score_user.investment_types["real_estate"] == "1" && (@savvy_score_user.investment_types["retirement_fund"] == "0" || @savvy_score_user.investment_types["stock_funds"] == "0"))
			real_estate_addition = 2
		end

		if (retirement_deduction > 0)
			message += "No Retirement Savings: -" + retirement_deduction.to_s + " points\n" + 
				"It's hard to relate to Future You, but investing in a retirement account early on is extremely important. "
				if(@savvy_score_user.investment_types["stock_funds"] == "1")
					message += "It's great that you've been investing in stock funds outside of retirement funds. This gives you some more flexibility to use the money when you'd like. You might consider additionally opening and contributing to a retirement account to take advantage of the tax benefits.\n"
				else
					message += "We recommend opening and contributing to a retirement account to take advantage of the tax benefits.\n"
				end
		end
		
		if (stock_fund_deduction > 0)
			message += "Not investing in a stock fund: -" + stock_fund_deduction.to_s + " points\n" + 
				"Beyond retirement savings, we additionally recommend investing in a stock fund so that you can put your savings to work.\n"
		end
		
		if (indiv_stock_addition > 0)
			message += "We gave you " + indiv_stock_addition.to_s + " points back for investing in individual company stocks. This doesn't make up the bulk of your Investments Score because most financial experts agree that funds (e.g. mutual funds, index funds) should make up most of your investment portfolio because they provide more diversification and lower your risk.\n"
		end

		if (real_estate_addition > 0)
			message += "We gave you " + real_estate_addition.to_s + " points back for investing in real estate. This doesn't make up the bulk of your Investments Score because most financial experts agree that funds (e.g. mutual funds, index funds) should make up most of your investment portfolio because they provide more diversification and lower your risk.\n"
		end

		if(@savvy_score_user.investments_score == 20)
			message += "You're in great shape here!"
		end
	end

end
