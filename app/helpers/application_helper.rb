module ApplicationHelper
	def monetize(number)
		unless number.nil?
			if number % 100 == 0
				money_number = "#{number_to_currency(number / 100)}"
			else
				money_number = "#{number_to_currency(number / 100.00)}"
			end
		end
	end
end
