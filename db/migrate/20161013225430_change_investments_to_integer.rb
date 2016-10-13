class ChangeInvestmentsToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :investing_profiles, :amount_to_get_started, :integer
  	change_column :investing_profiles, :amount_wants_to_invest, :integer
  end
end
