class ChangeAssociations < ActiveRecord::Migration[5.0]
  def change
  	add_reference :bills, :ticket, foreign_key: true
  	remove_column :bills, :saver_guest_id, :integer
  end
end
