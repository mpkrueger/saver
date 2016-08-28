class AddCurrentFocusToGuestUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :guest_users, :current_focus, :string
  end
end
