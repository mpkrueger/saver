class AddAmountEarnedToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :amount_earned, :integer
  end
end
