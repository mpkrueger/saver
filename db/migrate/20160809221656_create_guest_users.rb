class CreateGuestUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_users do |t|
      t.string :name
      t.integer :age
      t.decimal :student_amount
      t.decimal :cc_amount
      t.decimal :savings_amount
      t.hstore :investments_type
      t.string :spend_vs_income
      t.hstore :future_day
      t.string :preparedness

      t.timestamps
    end
  end
end
