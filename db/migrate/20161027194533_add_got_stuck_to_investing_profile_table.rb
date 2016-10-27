class AddGotStuckToInvestingProfileTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :investing_profiles, :got_stuck, :string
  end
end
