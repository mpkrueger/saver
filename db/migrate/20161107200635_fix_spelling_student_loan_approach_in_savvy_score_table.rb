class FixSpellingStudentLoanApproachInSavvyScoreTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :savvy_score_users, :student_loan_approach, :string
  	remove_column :savvy_score_users, :student_loan_apporach, :string
  end
end
