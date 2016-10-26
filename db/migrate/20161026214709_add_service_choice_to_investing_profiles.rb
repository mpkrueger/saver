class AddServiceChoiceToInvestingProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :investing_profiles, :service_choice, :string
  	add_column :investing_profiles, :vanguard_target_date, :string
  end
end
