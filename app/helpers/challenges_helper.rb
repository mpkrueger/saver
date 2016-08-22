module ChallengesHelper

	require "bigdecimal"

	# SAVINGS CHALLENGE METHODS
	def savings_intro_message
		@user = current_user
		case @user.fin_profile.current_focus
		when "SAVINGS", "SPENDING"
			"Ok - in this mini-challenge we're going to increase your Savvy Score by taking a small step toward better spending habits. It's going to be awesome."
		when "STUDENT LOANS"
			if @user.fin_profile.student_approach == "less than the amount due"
				"OK - with that in mind, adjusting your repayment plan or consolidation may be helpful. But our approach is to take small steps in the right direction and so we're going to start with a challenge to increase the amount you're paying toward those loans."
			elsif @user.fin_profile.student_approach == "the amount due"
				"Good to hear. Our plan will involve a few different components, including options like consolidation. First, we're going to start with a challenge to increase the amount you're paying toward those loans."
			end
		end
	end

	def less_food_message
		@user = current_user
		case @user.fin_profile.biggest_expense
		when "buying coffee"
			"skipped buying 1 coffee each week"
		when "going out for drinks"
			"skipped going out for drinks 1 night each week"
		when "eating lunch out"
			"skipped eating lunch out once per week"
		when "eating dinner out"
			"skipped eating dinner out once per week"
		end
	end

	def food_savings
		@user = current_user
		case @user.fin_profile.biggest_expense
		when "buying coffee"
			"$130"
		when "going out for drinks"
			"$390"
		when "eating lunch out"
			"$260"
		when "eating dinner out"
			"$390"
		end
	end

	def each_food_cost
		@user = current_user
		case @user.fin_profile.biggest_expense
		when "buying coffee"
			"coffee cost ~$5"
		when "going out for drinks"
			"night out cost ~$15"
		when "eating lunch out"
			"lunch out cost ~$10"
		when "eating dinner out"
			"dinner out cost ~$15"
		end
	end

	def biggest_expense_word
		@user = current_user
		case @user.fin_profile.biggest_expense
		when "buying coffee"
			"coffee"
		when "going out for drinks"
			"drinks"
		when "eating lunch out"
			"lunch"
		when "eating dinner out"
			"dinner"
		end
	end

	# LETS CHAT PAGE METHODS
	def lets_chat_message
		@user = current_user
		case @user.fin_profile.current_focus
		when "SAVINGS", "SPENDING"
			"savings savings savings"
		when "STUDENT LOANS"
			if @user.fin_profile.student_approach == "not sure"
				"I know it can be hard to keep track of... and easier not to think about it. But I'd really love to help."
			else
				"That's awesome. It also means I'm not entirely sure how I can be most helpful for you - and I want to better understand your situation."
			end
		when "CREDIT CARD DEBT"
			"Feeling unsure about your credit card debt?"
		when "INVESTMENTS"
			"investments $$$$$"
		end
	end

	# NEW FOCUS METHODS

	def new_focus_message
		@user = current_user

	end

	# DEBT METHODS
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

	def student_loans_yearly_interest
		@user = current_user
		@p = @user.fin_profile.student_amount
		@r = BigDecimal(@user.fin_profile.student_rate) / BigDecimal(100)
		@t = (BigDecimal(365) / BigDecimal(365)).round(8)
		@n = 1
		@r_over_n = (BigDecimal(@r)/BigDecimal(@n)).round(8)
		@new_balance = (@p * (BigDecimal(1 + @r_over_n))**(BigDecimal(@n * @t))).round(2)
		@yearly_interest = (@new_balance - @user.fin_profile.student_amount).to_i
	end

	def years_to_65
		@user = current_user
		years = 65 - @user.age
	end

	def amount_saved
		@user = current_user
		@amount = 20 * 52 * (65 - @user.age)
		number_with_delimiter(@amount)
	end

	def investment_growth
		@user = current_user
		@monthly = 20
		@growth_rate = 0.06
		@periods_per_year = 12
		@number_of_years = 65 - @user.age
		@total = @monthly * ((1 + @growth_rate / @periods_per_year) ** (@number_of_years * @periods_per_year) - 1) * (@periods_per_year / @growth_rate)
		number_with_delimiter(@total.round(0))
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
			"Because of those high interest amounts, we recommend that you pay off your credit card balance as soon as possible"
		when "SPENDING"
			"Because of how much you can gain in interest, we'd like to help you save (and invest) more"
		when "STUDENT LOANS"
			"Student loans can hang over you for years and years. We'd like to help you pay off your loans at a slightly faster pace"
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

	def challenge_icon
		@user = current_user
		case current_user.fin_profile.biggest_expense
		when "buying coffee"
			"icon_coffee.png"
		when "going out for drinks"
			"icon_cocktail.png"
		when "eating lunch out"
			"icon_pizza.png"
		when "eating dinner out"
			"icon_drumstick.png"
		end
	end

end
