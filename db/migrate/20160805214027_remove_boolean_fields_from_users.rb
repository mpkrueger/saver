class RemoveBooleanFieldsFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :student_loans
  	remove_column :users, :cc_debt
  	remove_column :users, :savings
  	remove_column :users, :investments
  	remove_column :users, :present_day
  end
end
