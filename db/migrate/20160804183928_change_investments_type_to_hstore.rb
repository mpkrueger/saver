class ChangeInvestmentsTypeToHstore < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :investments_type, 'hstore USING CAST(investments_type AS hstore)'
  end
end
