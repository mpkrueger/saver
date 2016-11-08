class ChangeInvestmentTypesToHashInSavvyScoreTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :savvy_score_users, :investment_types, :string
  	add_column :savvy_score_users, :investment_types, :hstore
  end
end
