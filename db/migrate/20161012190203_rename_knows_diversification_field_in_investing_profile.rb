class RenameKnowsDiversificationFieldInInvestingProfile < ActiveRecord::Migration[5.0]
  def change
  	add_column :investing_profiles, :explain_diversification, :string
  	remove_column :investing_profiles, :knows_diversification, :string
  end
end
