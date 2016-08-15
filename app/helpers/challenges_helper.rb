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

	def new_yearly_interest
		@user = current_user
		@p = @user.fin_profile.cc_amount
		@r = BigDecimal(@user.fin_profile.cc_rate) / BigDecimal(100)
		@t = (BigDecimal(365) / BigDecimal(365)).round(8)
		@n = 365
		@r_over_n = (BigDecimal(@r)/BigDecimal(@n)).round(8)
		@new_balance = (@p * (BigDecimal(1 + @r_over_n))**(BigDecimal(@n * @t))).round(2)
		@yearly_interest = (@new_balance - @user.fin_profile.cc_amount).to_i
	end

	def what_you_can_buy
		@user = current_user
		@difference =  new_weekly_balance - @user.fin_profile.cc_amount
		case @difference
		when (1..2)
			"an indulgent McDonalds cheeseburger"
		when (2..5)
			"a glorious morning latte"
		when (5..10)
			"a luxurious lunch out"
		when (10..20)
			"a delectable dinner out"
		when (20..30)
			"a delicious dinner for two"
		when (30..50)
			"a dreamy date night"
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

	def challenge_frequency
		@user = current_user
		@new_freq = @user.fin_profile.expense_frequency - 1
	end

	def expense_action
		@user = current_user
		case current_user.fin_profile.biggest_expense
		when "buying coffee"
			"buy coffee"
		when "going out for drinks"
			"go out for drinks"
		when "eating lunch out"
			"eat lunch out"
		when "eating dinner out"
			"eat dinner out"
		end
	end

	def expense_noun
		@user = current_user
		case current_user.fin_profile.biggest_expense
		when "buying coffee"
			"coffee trips"
		when "going out for drinks"
			"rounds of drinks"
		when "eating lunch out"
			"lunches"
		when "eating dinner out"
			"dinners"
		end
	end

end
