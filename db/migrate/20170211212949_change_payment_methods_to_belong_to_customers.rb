class ChangePaymentMethodsToBelongToCustomers < ActiveRecord::Migration[5.0]
  def change
  	add_reference :payment_methods, :customer, index: true
  	remove_column :payment_methods, :saver_guest_id, :integer
  end
end
