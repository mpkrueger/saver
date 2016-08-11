class AddSavvyFeelToGuestUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :guest_users, :savvy_feel, :string
  	add_column :users, :savvy_feel, :string
  end
end
