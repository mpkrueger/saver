class FeedbacksController < ApplicationController
	def new
		@user = current_user
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(params.require(:feedback).permit(:nps, :trust, :comment))
		@feedback.user = current_user

		if @feedback.save
			redirect_to dashboard_final_path
		else
			flash[:error] = "uh oh, there was an error - please try again or let us know!"
			redirect_to dashboard_thanks_path
		end
	end

	
end