module IntroHelper
	def follow_up_msg
		@guest_user = GuestUser.find_by_id(session[:guest_user_id])

		if @guest_user.has_these_types_of_debt["personal_loans"] == "1" 
      		"Before we go forward with an investment recommendation, we'd like to get more info 
      		on your personal loan(s). For example, if you have a high-interest rate on this loan, you may prefer to 
      		pay this off before making an investment. We'd love to follow-up just to make sure we make the best 
      		recommendation for you."

      	elsif @guest_user.has_these_types_of_debt["credit_card_debt"] == "1"
      		"Before we go forward with an investment recommendation, we'd like to get more info 
      		on your credit card debt. Since credit cards tend to charge a very high interest rate, you may prefer to 
      		pay this off before making an investment. We'd love to follow-up just to make sure we make the best 
      		recommendation for you."

      	elsif @guest_user.has_retirement_account == "No"
      		"Since you don't yet have a retirement account set up, we'd like to start there. We'd love to get some more info
      	 so that we can make the best recommendation for your situation."

   		elsif @guest_user.concerns_about_risks != nil
      		"We'd like to follow up on your specific concerns about risks before we walk through the steps of making an 
      		investment."

      	elsif @guest_user.remaining_concerns_about_access != nil 
      		"We'd like to follow up on your specific concerns about accessing the money you invest before we walk through the steps 
      		of making an investment."

      	elsif @guest_user.questions != "noNe"
      		"We'd like to follow up on your question before we walk through the steps of making an investment."

    	elsif @guest_user.investment_goal == "I need more money in the short-term and hope investing will help"
    		"As we mentioned, the stock market can go up and down in the short-term so it's possible to lose money in this timeframe. 
    		Our conservative recommendation would be to make long-term investments, but we'd like to follow up to see what makes
    		most sense for you."
    	end

	end
end
