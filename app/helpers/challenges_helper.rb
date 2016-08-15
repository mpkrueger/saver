module ChallengesHelper

	require "bigdecimal"

	def daily_interest_rate
		@user = current_user
		@daily_interest_calc = (@user.fin_profile.cc_rate / 365).round(2)
	end

	def daily_interest_amount
		@user = current_user
		@daily_amount_calc = (@user.fin_profile.cc_amount * daily_interest_rate / 100).round(2)	
	end

	def new_daily_balance
		@user = current_user
		@new_example_balance = (@user.fin_profile.cc_amount + daily_interest_amount).round(2)
	end

	def new_weekly_balance
		@user = current_user
		@p = @user.fin_profile.cc_amount
		@r = BigDecimal(@user.fin_profile.cc_rate) / BigDecimal(100)
		@t = (BigDecimal(7) / BigDecimal(365)).round(8)
		@n = 365
		@r_over_n = (BigDecimal(@r)/BigDecimal(@n)).round(8)
		@new_weekly_example_balance = (@p * (BigDecimal(1 + @r_over_n))**(BigDecimal(@n * @t))).round(2)
	end

	def what_you_can_buy
		@user = current_user
		@difference =  new_weekly_balance - @user.fin_profile.cc_amount
		case @difference
		when (1..2)
			"bus fare"
		when (2..5)
			"morning coffee"
		when (5..10)
			"lunch out"
		when (10..20)
			"dinner out"
		when (20..30)
			"dinner for two"
		when (30..50)
			"date night dinner"
		end
	end

	def cc_vs_savings
		@area = current_user.fin_profile.current_focus
		case @area
		when "CREDIT CARD DEBT"
			"that you pay off your credit card balance as soon as possible"
		when "SAVINGS HABITS"
			"that you save more"
		when "STUDENT LOANS"
			"that you pay off your loans at a faster pace"
		end
	end

end
