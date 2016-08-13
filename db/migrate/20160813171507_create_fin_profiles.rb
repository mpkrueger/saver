class CreateFinProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :fin_profiles do |t|
      t.string :savvy_feel
      t.decimal :student_amount
      t.decimal :cc_amount
      t.decimal :savings_amount
      t.hstore :investments_type
      t.string :spend_vs_income
      t.hstore :future_day
      t.string :preparedness
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
