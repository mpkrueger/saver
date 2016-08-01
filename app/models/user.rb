class User < ApplicationRecord

	serialize :investments_type
	serialize :spend_vs_income
	serialize :present_day
	serialize :future_day


	
end
