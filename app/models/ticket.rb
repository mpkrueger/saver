class Ticket < ApplicationRecord
  belongs_to :saver_guest
  belongs_to :admin_user
  has_many :bills
end
