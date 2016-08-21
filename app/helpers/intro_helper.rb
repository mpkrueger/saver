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
