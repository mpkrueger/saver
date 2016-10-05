class CreateBetaUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :beta_users do |t|
      t.string :first_name
      t.string :email

      t.timestamps
    end
  end
end
