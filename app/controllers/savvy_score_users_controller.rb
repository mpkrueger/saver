class SavvyScoreUsersController < ApplicationController
	def new
	end

	def create
		@savvy_score_user = SavvyScoreUser.new(savvy_score_user_params)
		if @savvy_score_user.save
			session[:savvy_score_user_id] = @savvy_score_user.id
			redirect to savvy_score_index_path
		else
			flash[:error] = "uh oh"
			redirect_to root_path
		end
	end

	def update
		
	end

	private

	def savvy_score_user_params
		params.require(:savvy_score_user).permit()
	end
end
