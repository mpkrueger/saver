class AddAnotheryearFieldToSaverGuestsTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :saver_guests, :another_year, :string
  end
end
