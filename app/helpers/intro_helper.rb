module IntroHelper

	def student_loans_info
		@guest_user = @guest_user
		i = @guest_user.age.to_i
		case i
		when (20..30)
			"Awesome that you're starting young, by the way! A lot of people your age deal with student loans."
		else
			"A lot of people are saddled with student loans."
		end
	end

	def savvy_feel_feedback
		@guest_user = @guest_user
		case @guest_user.savvy_feel
		when 'Feels like a foreign language'
			"Understandable, thanks for sharing that. Money can be intimidating and I hope I can help."
		when 'I know the basics, but that\'s it'
			"Great that you know some basics. I hope I can make things clearer to help you build up a better foundation."
		when 'I\'m savvier than most'
			"Great, that means you probably have a good foundation that we can build on!"
		when 'I\'m a pro'
			"Awesome to hear."
		end
	end

	def preparedness_feedback
		@guest_user = @guest_user
		case @guest_user.preparedness
		when '1'
			"Nothing's totally impossible, we'll work on getting there together."
		when '2'
			"It's hard, but well worth it. We'll work on getting there together."
		when '3'
			"Great, I'm here to help you make that future a reality."
		when '4'
			"Great to hear!"
		end
	end

	def student_loans_message
		@guest_user = @guest_user
		case @guest_user.student_amount
		when 0
			"That's great! Not having student loans gives you more financial flexibility."
		when 1
			case @guest_user.student_attitude
			when 'I\'m fine with them'
				"You’re in good company. 70\% of college grads end up with student loans."
			when 'I want to pay them off ASAP'
				"Ok, it's good to know that's an area you want to work on."
			end
		end
	end

	def savings_feedback
		@guest_user = @guest_user
		case @guest_user.savings_amount
		when 0
			"Cool, we’ll work on that. 46\% of Americans wouldn’t be able to cover a sudden $400 expense so you’re not alone."
		when 1
			"Cool, we’ll work on increasing that. It’s generally good to have about 3-6 months worth of expenses saved up... just in case!"
		when 2, 3
			"That’s great, glad to hear you’re on the right track."
		end
	end

	def investment_question
		@guest_user = @guest_user
		case @guest_user.savings_amount
		when 0, 1
			"Do you have any investments?"
		when 2, 3
			"Are you putting any of your money to work?"
		end
	end

	def investment_feedback
		@guest_user = @guest_user
		if @guest_user.investments_type['retirement_fund'] == "0" and @guest_user.investments_type['company_stock'] == "0"
			if @guest_user.investments_type['stock_market'] == "0"
				"Investing can definitely be intimidating. It'd be great to start working on that together."
			else
				"Glad to hear you’re doing some investing!"
			end
		else
			"Glad to hear you’re doing some investing!"
		end
	end

	def cc_feedback
		@guest_user = @guest_user
		case @guest_user.cc_amount
		when 4
			"That's great that you pay off your statement every month!"
		when 1, 2, 3
			if @guest_user.cc_attitude == "pay off my debt faster"
				"I understand, it's easy to build up credit card debt. This chat is a great first step. I'll come up with a plan to help you pay it off faster. Let me understand your full financial picture first."
			elsif @guest_user.cc_attitude == "get some advice"
				"I understand, it's easy to build up credit card debt. I'd love to help you with it. Let me understand your full financial picture first."
			else
				"That's good to know. We'll come back to this later because credit card debt in particular has a big impact on your finances."
			end
		when 0
			"Ok, good to know that you're avoiding credit card debt."
		end
	end

	def savings_habits_feedback
		@guest_user = @guest_user
		case @guest_user.spend_less
		when 'yeah'
			"Great, I have some fun ideas on how to make saving fun. We'll talk more about that later."
		when 'it depends'
			"Cool, I have some fun ideas on how to make saving fun and I think good savings habits are 
			well worth it, but we can talk more about that later."
		when 'no'
			"Cool, I understand there may not be any wiggle room in how much you spend/save each month. 
			We can talk about other potential ways to increase your savings each month later."
		when ''
			if @guest_user.savings_from_income == "a lot"
				"Wow, that's great that you've built up such a good savings habit!"
			else
				"Having good savings habits is the best way to build up your overall wealth."
			end
		end
	end

	def savvy_score_thoughts
		if @guest_user.savvy_score < 40
			"is on the low side."
		elsif @guest_user.savvy_score < 75
			"is a decent start."
		elsif @guest_user.savvy_score < 90
			"is pretty good."
		else
			"is top-notch."
		end
	end

	def focus_area_feedback
		@guest_user = @guest_user
		@savings_amount = ""

		case @guest_user.savings_amount
		when 1
			@savings_amount = "hundreds"
		when 2
			@savings_amount = "thousands"
		when 3
			@savings_amount = "tens of thousands"
		end

		case @guest_user.area_to_work_on
		when "CREDIT CARD DEBT"
			if @guest_user.cc_attitude == "pay off my debt faster"
				"That's something you mentioned wanting to pay off faster and it's a great place to start since 
					it often has high interest rates. That means your credit card company is getting 
					more of your hard-earned money. I have some good ideas to start tackling this."
			elsif @guest_user.cc_attitude == "continue what I'm doing"
				"You mentioned that you're ok with your current approach to those credit cards so I would love 
					to start by chatting and better understanding your situation."
			elsif @guest_user.cc_attitude == "get some advice"
				"Since credit cards often have high interest rates and you mentioned it's an area you want help 
					with, let's tackle that together first."
			end		
		when "STUDENT LOANS"
			"I'd like to start there since you mentioned wanting to pay them off faster and doing so would free 
				up extra money each month!"
		when "SAVINGS HABITS"
			if @guest_user.spend_less == "yeah"
				"I'd like to start there because saving each month is the foundation of a healthy financial 
				house. And you don't have any credit card debt to address which is fantastic. So let’s 
				see if we can try to cut back a little and grow your overall wealth."
			elsif @guest_user.spend_less == "it depends"
				"I'd like to start there because saving each month is the foundation of a healthy financial 
				house. And you don't have any credit card debt to address which is fantastic. You 
				sounded a little unsure about whether you can cut back, but let's give this a shot!"
			elsif @guest_user.spend_less == "no"
				"You mentioned that you don't think you can cut back on anything. I definitely understand,
				it's not always possible to spend any less to save more. We may have to consider some bigger
				changes. I'd love to start by chatting so I can better understand your situation."
			end

		when "SAVINGS"
			if @guest_user.savings_amount == 0
				"I'd like to start there because you mentioned that someone raided your piggy bank (not cool!). 
				Having a healthy emergency fund (a fat piggybank) is critical. I know you've got some exciting 
				plans, but I want you to be ok if there are any surprises along the way."
			else
				"I'd like to start there because you mentioned that your piggy bank has " + @savings_amount +
				" of dollars. Having a healthy emergency fund (a fat piggybank) is critical. I know you've got 
				some exciting plans, but I want you to be ok if there are any surprises along the way."
			end
		when "INVESTMENTS"
			if @guest_user.investments_type["retirement_fund"] == "0"
				"You're in good shape overall! No credit card debt and a good amount saved up. But you mentioned 
					not having any retirement accounts. A little now adds up quickly for the future, so let's 
					work on that first together."
			elsif @guest_user.investments_type["stock_market"] == "0"
				"You're in good shape overall! No credit card debt and a good amount saved up. But you mentioned 
					that you haven't yet started investing in the stock market - so let's work on that together 
					first, so we help your savings grow faster."
			end
		end
	end

	def focus_area_examples
		@guest_user = @guest_user
		case @guest_user.area_to_work_on
		when "CREDIT CARD DEBT"
			if @guest_user.cc_attitude == "pay off my debt faster"
				"I want to help you: pay off more of your debt each month, 
				evaluate different payment strategies, and explore ways to consolidate your credit card 
				balances."
			elsif @guest_user.cc_attitude == "continue what I'm doing"
				"I want to see if we can tackle it because this type of debt usually has a big negative 
				impact on financial goals."
			elsif @guest_user.cc_attitude == "get some advice"
				"I'm really excited to help you take the first step toward taming that credit card debt."
			end		
		when "STUDENT LOANS"
			"I want to help you: pay off more of your loans each month, explore whether we can consolidate 
			your loans, and look into alternative repayment options."
		when "SAVINGS HABITS", "SAVINGS"
			"Let's face it - budgeting by yourself isn't fun. That's where I come in! I've got a series of 
			fun challenges that will have you saving more starting this week."
		when "INVESTMENTS"
			if @guest_user.investments_type["retirement_fund"] == "0"
				"Retirement can feel like it's a long way away - but time is your best friend. I'll make it
				 easy to get started investing for the future so that your money can grow on its own."
			elsif @guest_user.investments_type["stock_market"] == "0"
				"Investing can seem complex and overwhelming but it doesn't need to be. I'll provide simple 
				steps to get you going while teaching you about investing along the way."
			end
		end
	end

	def focus_area_next_action 
		@guest_user = @guest_user
		@savings_amount = ""

		case @guest_user.savings_amount
		when 1
			@savings_amount = "hundreds"
		when 2
			@savings_amount = "thousands"
		when 3
			@savings_amount = "tens of thousands"
		end

		case @guest_user.area_to_work_on
		when "CREDIT CARD DEBT"
			if @guest_user.cc_attitude == "pay off my debt faster"
				"so that I can get you started on the path towards debt-free living."
			elsif @guest_user.cc_attitude == "continue what I'm doing"
				"so that I can get to know you better and help you take the best steps forward towards your 
					future goals."
			elsif @guest_user.cc_attitude == "get some advice"
					"so that I can get to know you better and help you take the best steps forward towards 
						your future goals."
		end		
		when "STUDENT LOANS"
			"so that I can get you started on the path towards debt-free living."
		when "SAVINGS HABITS"
			"so that I can get you started on the path towards your future goals."
		when "SAVINGS"
			if @guest_user.savings_amount == 0
				"so that I can get your piggy bank repaired and help you fill it up."
			else
				"so that I can help you build up those savings."
			end
		when "INVESTMENTS"
			if @guest_user.investments_type["retirement_fund"] == "0"
				"so that I can help you get your retirement fund jumpstarted."
			elsif @guest_user.investments_type["stock_market"] == "0"
				"so that I can help you put your savings to work to earn you more money."
			end
		end
	end


	def future_financials
		@guest_user = @guest_user
		case @guest_user.future_day['financially']
		when 1
			"Unfortunately, financially things are not so good. But there are a lot of years 
			left to change that."
		when 2
			"And in good news, finances are looking better. There's more to do, but Future" 
			+ @guest_user.name + "is feeling confident."
		when 3
			"Best of all, Future" + @guest_user.name + " has made awesome financial decisions and 
			is now riding high. "
		end
	end

	def future_livingwith
		@guest_user = @guest_user
		case @guest_user.future_day['living_with']
		when 'my soulmate'
			'your soulmate'
		when 'my family'
			'your family'
		when 'roommates'
			'your roommates'
		when 'no one else'
			'no one so you can dance around'
		end
	end

	def future_work
		@guest_user.future_day['company'].gsub('my','your').gsub(/\bI'm\b/, 'you\'re').gsub(/\bI\b/, 'you')
	end

	def future_fun
		@guest_user.future_day['evenings'].gsub(/\bI'm\b/, 'you\'re').gsub(/\bmy\b/, 'your').gsub(/\bI\b/, 'you')
	end
end
