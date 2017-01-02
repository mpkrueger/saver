class AddAdminUserToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :admin_user, foreign_key: true
  end
end
