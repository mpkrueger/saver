class GuestUser < ApplicationRecord
	
	validates :name, :age, presence: true

end
