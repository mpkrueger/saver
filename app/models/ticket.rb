class Ticket < ApplicationRecord
  belongs_to :saver_guest
  has_many :bills
end
