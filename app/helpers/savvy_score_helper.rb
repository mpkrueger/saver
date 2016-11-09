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
			"On the low side."
		elsif @savvy_score_user.savvy_score < 75
			"A decent start."
		elsif @savvy_score_user.savvy_score < 90
			"Pretty good."
		else
			"Top-notch!"
		end
	end

end
