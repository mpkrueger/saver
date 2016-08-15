class AddSavingInfoFieldsToFinProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :fin_profiles, :saving_feeling, :string
  	add_column :fin_profiles, :saving_approach, :string
  	add_column :fin_profiles, :fixed_expenses, :string
  end
end
