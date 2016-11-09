class AddPersonalLoansInterestToSavvyScoreUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :savvy_score_users, :personal_loans_interest, :string
  end
end
