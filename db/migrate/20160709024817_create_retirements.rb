class CreateRetirements < ActiveRecord::Migration[5.0]
  def change
    create_table :retirements do |t|
      t.decimal :savings
      t.decimal :age
      t.decimal :years_remaining
      t.decimal :annual_spend

      t.timestamps
    end
  end
end
