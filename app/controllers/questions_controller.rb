class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)

		if @question.save
			flash[:notice] = "Your comment has been submitted!"
			redirect_to root_path
		else
			flash[:error] = "There was an issue submitting your comment - please try again!"
			redirect_to contact_us_path
		end
	end

	def contact_us
	end

	private

	def question_params
		params.require(:question).permit(:message, :email_contact)
	end
end
