class AddTosAcceptedToCustomer < ActiveRecord::Migration[5.0]
  def change
  	add_column :customers, :tos_accepted, :boolean, default: :false
  	add_column :customers, :tos_accept_date, :datetime
  end
end
