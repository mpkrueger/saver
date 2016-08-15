class AddSavingsFieldsToFinProfileTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :fin_profiles, :biggest_expense, :string
  	add_column :fin_profiles, :expense_frequency, :integer
  	add_column :fin_profiles, :current_focus, :string
  end
end
