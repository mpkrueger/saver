class AddPhoneNumberToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :guest_user_id, :integer
  end
end
