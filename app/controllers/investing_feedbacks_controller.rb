class InvestingFeedbacksController < ApplicationController
	def new
	end

	def create
		@user = current_user
		@investing_feedback = InvestingFeedback.new(investing_feedback_params)
		@investing_feedback.user = @user

		@investing_feedback.save
	end

	def update
		@user = current_user
		@investing_feedback = @user.investing_feedback

		if @investing_feedback.update_attributes(investing_feedback_params)
			redirect_to dashboard_invested_thanks_path
		else
			redirect_to root_path
		end
	end
	
	private

	def investing_feedback_params
		params.require(:investing_feedback).permit(:investment_service, :invested_amount, :investing_experience, 
			:investing_better, :got_stuck)
	end
end
