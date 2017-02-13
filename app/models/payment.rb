class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :payment_method
end
