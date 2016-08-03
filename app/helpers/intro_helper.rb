module IntroHelper
	def student_loans_message
		@user = @current_user
		case @user.student_amount
		when 0
			"Great job!"
		when 1
			"Not bad!"
		when 2
			"That’s rough, but you’re in good company."
		when 3
			"That’s rough, you must be eager to get those off your back."
		end
	end

	def savings_feedback
		@user = @current_user
		case @user.savings_amount
		when 0
			"Cool, we’ll work on that. 46 of Americans wouldn’t be able to cover a sudden $400 expense so you’re not alone."
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
			"Investments get easier once you have more money to invest."
		else
			"Glad to hear you’re doing some investing. Gets even better when you have more to invest."
		end
	end
end
