class AddFuturePreparednessToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :preparedness, :string
  end
end
