class InvestingProfile < ApplicationRecord
  belongs_to :user

  def amount_to_invest=(amount)
  	self.amount_to_get_started = amount.delete(",").to_i
  end

  def amount_to_invest
  	self.amount_to_get_started
  end

end
