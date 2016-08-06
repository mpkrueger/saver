class AddSavvyScoreComponentsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :savvy_score_components, :hstore
  end
end
