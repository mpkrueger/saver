class AddStartOrRemainToBetaUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :beta_users, :start_or_remind, :string
  end
end
