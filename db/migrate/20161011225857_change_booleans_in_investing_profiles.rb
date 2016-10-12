class ChangeBooleansInInvestingProfiles < ActiveRecord::Migration[5.0]
  def change
  	change_column :investing_profiles, :explain_stocks_vs_funds, :string
  	change_column :investing_profiles, :knows_diversification, :string
  	change_column :investing_profiles, :worry_about_risks, :string
  	change_column :investing_profiles, :curious_about_access_to_money, :string
  	change_column :investing_profiles, :remaining_concerns_about_access, :string
  	change_column :investing_profiles, :knows_amount_to_invest, :string
  	change_column :investing_profiles, :has_retirement_account, :string
  	change_column :investing_profiles, :has_invested_before, :string
  end
end
