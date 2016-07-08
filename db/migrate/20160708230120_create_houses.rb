class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.decimal :budget
      t.decimal :down_payment
      t.decimal :years_owning

      t.timestamps
    end
  end
end
