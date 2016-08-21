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
			"Great, that means you probably have a good foundation that I can build on!"
		when 'I\'m a pro'
			"Awesome to hear."
		end
	end

	def preparedness_feedback
		@guest_user = @guest_user
		case @guest_user.preparedness
		when '1'
			"Nothing's totally impossible - we'll work on getting there together."
		when '2'
			"Worthwhile things often require hard work - we'll work on getting there together."
		when '3'
			"Great - I'm here to help you maximize the benefits of that effort."
		when '4'
			"Great to hear!"
		end
	end

	def student_loans_message
		@guest_user = @guest_user
		case @guest_user.student_amount
		when 0
			"That's great! Not having to pay towards student loans provides more financial flexibility. That'll get reflected in your Savvy Score."
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
			"Cool, we’ll work on increasing that. It’s generally good to have about 3-6 months worth of expenses saved up for emergencies."
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
			"We understand, it's easy to build up credit card debt. Going through this process is a great first step. We'll come up with a plan to tackle this together."
		when 0
			"Ok, good to know that you're avoiding credit card debt."
		end
	end

	def spending_feedback
		@guest_user = @guest_user
		case @guest_user.spend_vs_income
		when 'a little'
			"Wow, that's great that you've built up such a good savings habit."
		when 'some'
			"Cool, every penny counts!"
		when 'most','all'
			"It can be hard to stretch your paycheck. We'll see if we can come up with creative ways to start saving a little."
		end
	end

	def savvy_score_thoughts
		if @guest_user.savvy_score < 40
			"is lower than I like to see. As your financial coach, I'm going to partner with you to drive it higher."
		elsif @guest_user.savvy_score < 75
			"is a bit lower than I like to see. As your financial coach, I'm going to partner with you to drive it higher."
		elsif @guest_user.savvy_score < 95
			"is in pretty good shape, but together we can get it even higher. As your financial coach, I'll show you how."
		else
			"is top-notch. I can help you optimize a bit further, or perhaps you can help mentor others!"
		end
	end

	def focus_area_feedback
		@guest_user = @guest_user
		@cc_debt_amount = ""
		@savings_amount = ""

		case @guest_user.cc_amount
		when 1
			@cc_debt_amount = "less than $1,000"
		when 2
			@cc_debt_amount = "between $1,000 and $5,000"
		when 3
			@cc_debt_amount = "more than $5,000"
		end

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
				"You mentioned having " + @cc_debt_amount + " in credit card debt and a desire to pay it off faster. Because credit cards often have high interest rates, that's the area that I want to tackle with you first."
			elsif @guest_user.cc_attitude == "continue what I\'m doing"
				"You mentioned having " + @cc_debt_amount + " in credit card debt. You also said you wanted to continue with it. Because credit cards often have high interest rates, I want to work with you on it and better understand your situation."
			elsif @guest_user.cc_attitude == "get some help"
				"You mentioned having " + @cc_debt_amount + " in credit card debt. You also said you wanted some help figuring out how to approach it. Because credit cards often have high interest rates, that's the area that I want to tackle with you first."
			end		
		when "STUDENT LOANS"
			"You mentioned having student loans and a desire to pay it off faster. You also don't have any credit card debt so we don't have to worry about higher interest rates. So we'll focus first on helping you pay off those student loans more quickly."
		when "SPENDING"
			"You mentioned that you spend " + @guest_user.spend_vs_income + " of your income each month currently. You also don't have any credit card debt to work on first. So I want to work with you on spending less each month and then I'll help you figure out the best thing to do with that savings."
		when "SAVINGS"
			if @guest_user.savings_amount == 0
				"You mentioned that someone raided your piggy bank "
			else
				"You mentioned that you have " + @savings_amount + " in savings right now. Because you don't have credit card debt to worry about and already spend less than you earn each month, we're going to focus first on building up your savings for emergencies."
			end
		when "INVESTMENTS"
			if @guest_user.investments_type["retirement_fund"] == "0"
				"You're in good shape overall! No credit card debt to worry about, a good foundation of savings, and healthy spending habits. You mentioned not having any retirement accounts - so I'd like to work with you on that first. They provide a lot of benefits and it's best to get started as early as possible."
			elsif @guest_user.investments_type["stock_market"] == "0"
				"You're in good shape overall! No credit card debt to worry about, a good foundation of savings, and healthy spending habits. You also already have a retirement account set up - nice! You don't have any other investments in the stock market though - so I'd like to work with you on that so that your savings can go to work for you."
			else
				"You're in good shape overall! No credit card debt to worry about, a good foundation of savings, and healthy spending habits. You also already have a retirement account set up - nice! We're going to work on improving your overall investment strategy outside of that, which can feel daunting but can be very valuable."
			end
		end
	end

	def future_financials
		@guest_user = @guest_user
		case @guest_user.future_day['financially']
		when 1
			"Unfortunately, financially things are not so good. But there are a lot of years left to change that."
		when 2
			"And in good news, finances are looking better. There's more to do, but Future" + @guest_user.name + "is feeling confident."
		when 3
			"Best of all, Future" + @guest_user.name + " has made awesome financial decisions and is now riding high. "
		end
	end

	def future_livingwith
		@guest_user = @guest_user
		case @guest_user.future_day['living_with']
		when 'my partner'
			'your partner'
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
