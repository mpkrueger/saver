module IntroHelper
	def student_loans_message
		@user = @current_user
		case @user.student_amount
		when 0
			"That's great!"
		when 1
			"Not bad!"
		when 2
			"Rough, but you’re in good company."
		when 3
			"You must be eager to get those off your back."
		end
	end

	def savings_feedback
		@user = @current_user
		case @user.savings_amount
		when 0
			"Cool, we’ll work on that. 46\% of Americans wouldn’t be able to cover a sudden $400 expense so you’re not alone."
		when 1
			"Cool, we’ll work on increasing that. It’s generally good to have about 3-6 months worth of expenses saved up."
		when 2, 3
			"That’s great, glad to hear you’re on the right track."
		end
	end

	def investment_question
		@user = @current_user
		case @user.savings_amount
		when 0, 1
			"Do you have any investments?"
		when 2, 3
			"Are you putting any of your money to work?"
		end
	end

	def investment_feedback
		@user = @current_user
		case @user.investments_type
		when "other"
			"Investing can be intimidating."
		else
			"Glad to hear you’re doing some investing."
		end
	end

	def future_story
		@user = @current_user
		case @user.future_day['financially']
		when 1
			"Unfortunately, financially things are not so good. But there are a lot of years left to change that."
		when 2
			"And in good news, finances are looking better. There's more to do, but Future" + @user.name + "is feeling confident."
		when 3
			"Best of all, Future" + @user.name + " has made awesome financial decisions and is now riding high. "
		end
	end
end
