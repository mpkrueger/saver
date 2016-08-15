module DashboardHelper

	def homepage_challenge_button
		case @user.fin_profile.current_focus
		when "SAVINGS HABITS", "SAVINGS"
			challenges_saving_info_path
		when "STUDENT LOANS"
			challenges_student_loan_info_path
		when "CREDIT CARD DEBT"
			challenges_credit_card_info_path
		when "INVESTMENTS"
			challenges_investment_info_path
		end
	end


end
