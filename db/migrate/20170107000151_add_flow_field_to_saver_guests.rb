class AddFlowFieldToSaverGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :saver_guests, :flow, :string
  end
end
