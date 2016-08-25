class AddInvestmentFieldsToFinProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :fin_profiles, :company_401k, :string
  	add_column :fin_profiles, :company_matches, :boolean
  	add_column :fin_profiles, :invest_now, :string
  	add_column :fin_profiles, :invest_decision, :string
  end
end
