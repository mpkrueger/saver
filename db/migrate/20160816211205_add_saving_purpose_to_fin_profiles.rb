class AddSavingPurposeToFinProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :fin_profiles, :saving_purpose, :string
  	add_column :fin_profiles, :saving_purpose_free_form, :text
  	remove_column :fin_profiles, :saving_feeling, :string
  	remove_column :fin_profiles, :saving_approach, :string
  	remove_column :fin_profiles, :fixed_expenses, :string
  end
end
