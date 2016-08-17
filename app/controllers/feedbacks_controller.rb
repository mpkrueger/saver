class FeedbacksController < ApplicationController
	def new
		@user = current_user
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(params.require(:feedback).permit(:nps, :trust, :comment))
		@feedback.user = current_user

		if @feedback.save
			redirect_to root_path
		else
			flash[:error] = "uh oh, there was an error - please try again or let us know!"
			redirect_to root_path
		end
	end

	
end