class RenameSpendVsIncome < ActiveRecord::Migration[5.0]
  def change
  	add_column :guest_users, :savings_from_income, :string
  	add_column :fin_profiles, :savings_from_income, :string
  	remove_column :guest_users, :spend_vs_income, :string
  	remove_column :fin_profiles, :spend_vs_income, :string
  end
end
