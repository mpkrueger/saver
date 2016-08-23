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
			"Cool, we’ll work on increasing that. It’s generally good to have about 3-6 months worth of expenses saved up for emergencies... just in case!"
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
				"I understand, it's easy to build up credit card debt. This chat is a great first step. I'll come up with a plan to help you pay it off faster."
			elsif @guest_user.cc_attitude == "get some advice"
				"I understand, it's easy to build up credit card debt. I'd love to help you with it."
			else
				"That's good to know. We'll come back to this later because credit card debt in particular has a big impact on your finances."
			end
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
		when 'most'
			"It can be hard to stretch your paycheck. We'll see if we can come up with creative ways to start saving a little more."
		when 'all'
			"It can be hard to stretch your paycheck. We'll see if we can come up with creative ways to start saving a little."
		end
	end

	def savvy_score_thoughts
		if @guest_user.savvy_score < 40
			"is a bit lower than I'd like to see. But don't be discouraged, there's a lot we can do together. As your financial coach, I'm here to help you get more financially savvy."
		elsif @guest_user.savvy_score < 75
			"is a bit lower than I'd like to see. But don't worry, there's a lot we can do together. As your financial coach, I'm here to help you get more financially savvy."
		elsif @guest_user.savvy_score < 95
			"is pretty good, but I think we can get it even higher if we work together. As your financial coach, I'll help you boost your financial savvy."
		else
			"is top-notch. I can help you optimize a bit further, or perhaps you can help mentor others!"
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
				"You mentioned wanting to pay off your credit card debt faster. Credit cards often have high interest rates which means your credit card company is getting your hard-earned money for free. That seems unfair, let's see if we can avoid that. I have some good ideas to start tackling this."
			elsif @guest_user.cc_attitude == "continue what I\'m doing"
				"I suggested working on your credit card debt first because this type of debt usually has a big negative impact on financial goals. But you mentioned that you’re OK with your current approach. We should start by chatting so that we tackle something that makes sense for you."
			elsif @guest_user.cc_attitude == "get some advice"
				"Since credit cards often have high interest rates and you mentioned it's an area you want help with, let's tackle that together first."
			end		
		when "STUDENT LOANS"
			"Since you want to pay off your student loans faster, let's focus on squashing those loans together."
		when "SPENDING HABITS"
			"First off, you don't have credit card debt - so you're already in better shape than 38% of Americans. But you did say that you spend " + @guest_user.spend_vs_income + " of your income each month. So let’s see if we can try to cut back a little and then use those extra savings to grow your overall wealth."
		when "SAVINGS"
			if @guest_user.savings_amount == 0
				"First off, you don't have credit card debt - so you're already in better shape than 38% of Americans. But you did mention that someone raided your piggy bank (not cool!). We'll start there because having a healthy emergency fund (i.e. a fat piggybank) is critical. I know you've got some exciting plans, but I want you to be prepared just in case there are any sudden twists or turns along the way."
			else
				"First off, you don't have credit card debt - so you're already in better shape than 38% of Americans. You mentioned that you have " + @savings_amount + " in savings. We'll start there because having a healthy emergency fund (i.e. a fat piggybank) is critical. When life throws you a nasty surprise, I don't want you to be in a pickle."
			end
		when "INVESTMENTS"
			if @guest_user.investments_type["retirement_fund"] == "0"
				"You're in good shape overall! No credit card debt, a good foundation of savings, and healthy spending habits. But you mentioned not having any retirement accounts. A little now in retirement accounts adds up quickly for the future, so let's work on that first together."
			elsif @guest_user.investments_type["stock_market"] == "0"
				"You're in good shape overall! No credit card debt, a good foundation of savings, and healthy spending habits. You also already have a retirement account set up - nice! You don't have any other investments in the stock market though - so let's work on that together first, so we help your savings grow faster."
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
			elsif @guest_user.cc_attitude == "continue what I\'m doing"
				"so that I can get to know you better and help you take the best steps forward towards your future goals."
			elsif @guest_user.cc_attitude == "get some advice"
					"so that I can get to know you better and help you take the best steps forward towards your future goals."
		end		
		when "STUDENT LOANS"
			"so that I can get you started on the path towards debt-free living."
		when "SPENDING HABITS"
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
