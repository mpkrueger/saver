module ServicesHelper
	require 'rounding'

	def target_date_for_user
		@user = current_user
		nearest_fund = "20" + "#{(16 + (65 - @user.age)).round_to(5)}"
	end

	def vanguard_url
		@user = current_user
		@vanguard_target_date = @user.investing_profile.vanguard_target_date
		case @vanguard_target_date
		when "2030"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=0695&FundIntExt=INT"
		when "2035"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=0305&FundIntExt=INT"
		when "2040"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=0696&FundIntExt=INT"
		when "2045"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=0306&FundIntExt=INT"
		when "2050"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=0699&FundIntExt=INT"
		when "2055"
			"https://personal.vanguard.com/us/funds/snapshot?FundId=1487&FundIntExt=INT"
		when "2060"
			"https://personal.vanguard.com/us/funds/snapshot?FundIntExt=INT&FundId=1691"
		end
	end
end
