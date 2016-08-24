class AddSpendLessToGuestUsers < ActiveRecord::Migration[5.0]
  def change
  	 add_column :guest_users, :spend_less, :string
  	 add_column :fin_profiles, :spend_less, :string
  end
end
