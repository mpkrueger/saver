class User < ApplicationRecord

	validates :name, :age, presence: true

	serialize :spend_vs_income
	serialize :present_day


	
end
