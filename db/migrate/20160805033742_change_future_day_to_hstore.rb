class ChangeFutureDayToHstore < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :future_day, 'hstore USING CAST(future_day AS hstore)'
  end
end
