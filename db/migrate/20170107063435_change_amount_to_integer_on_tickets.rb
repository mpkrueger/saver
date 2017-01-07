class ChangeAmountToIntegerOnTickets < ActiveRecord::Migration[5.0]
  def change
  	Ticket.where(amount_saved: "").update_all(amount_saved: nil)
  	change_column :tickets, :amount_saved, 'integer USING CAST(amount_saved AS integer)'
  end
end
