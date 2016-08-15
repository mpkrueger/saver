class RemoveFinFieldsFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :student_amount, :decimal
  	remove_column :users, :cc_amount, :decimal
  	remove_column :users, :savings_amount, :decimal
  	remove_column :users, :investments_type, :hstore
  	remove_column :users, :spend_vs_income, :string
  	remove_column :users, :future_day, :hstore
  	remove_column :users, :preparedness, :string
  	remove_column :users, :savvy_feel, :string
  end
end
