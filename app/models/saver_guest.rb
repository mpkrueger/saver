class SaverGuest < ApplicationRecord
	has_many :tickets
	has_many :bills, through: :tickets
end
