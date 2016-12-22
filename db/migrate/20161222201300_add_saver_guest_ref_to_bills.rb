class AddSaverGuestRefToBills < ActiveRecord::Migration[5.0]
  def change
    add_reference :bills, :saver_guest, foreign_key: true
  end
end
