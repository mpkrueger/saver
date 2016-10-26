class AddEmailToGuestUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :guest_users, :email, :string
  end
end
