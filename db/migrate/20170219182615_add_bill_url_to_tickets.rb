class AddBillUrlToTickets < ActiveRecord::Migration[5.0]
  def change
  	add_column :tickets, :bill_key, :string
  end
end
