class CreateSaverGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :saver_guests do |t|
      t.string :last_moved
      t.string :negotiated
      t.hstore :services
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
