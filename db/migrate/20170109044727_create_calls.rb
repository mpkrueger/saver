class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :agent_name
      t.integer :new_monthly_rate
      t.integer :courtesy_credit
      t.string :confirmation_number
      t.text :notes
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
