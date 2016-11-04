class CreateSavvyScoreUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :savvy_score_users do |t|
      t.string :name
      t.string :age
      t.string :savvy_feel
      t.hstore :debt_types
      t.string :cc_amount
      t.string :cc_approach
      t.string :student_loan_amount
      t.string :student_loan_apporach
      t.string :personal_loan_amount
      t.string :savings_amount
      t.string :spending_habit
      t.string :investment_types
      t.string :debt_question
      t.string :savings_question
      t.string :investment_question
      t.string :spending_question

      t.timestamps
    end
  end
end
