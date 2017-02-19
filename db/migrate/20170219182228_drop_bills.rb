class DropBills < ActiveRecord::Migration[5.0]
  def change
  	drop_table :bills
  end
end
