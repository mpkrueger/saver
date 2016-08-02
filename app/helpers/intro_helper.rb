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
end
