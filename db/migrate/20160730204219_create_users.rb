class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :why_here
      t.string :money_feels
      t.string :name
      t.integer :age
      t.boolean :student_loans
      t.decimal :student_amount
      t.boolean :cc_debt
      t.decimal :cc_amount
      t.boolean :savings
      t.decimal :savings_amount
      t.boolean :investments
      t.text :investments_type
      t.text :spend_vs_income
      t.text :present_day
      t.text :future_day
      t.decimal :financial_score

      t.timestamps
    end
  end
end
