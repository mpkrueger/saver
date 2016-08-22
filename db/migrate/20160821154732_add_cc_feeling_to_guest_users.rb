class AddCcFeelingToGuestUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :guest_users, :cc_attitude, :string
  	add_column :fin_profiles, :cc_attitude, :string
  	remove_column :fin_profiles, :cc_feeling, :string
  end
end
