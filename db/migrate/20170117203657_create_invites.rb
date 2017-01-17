class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :receiver_email
      t.text :email_message
      t.integer :incentive_amt
      t.integer :receiver_id
      t.boolean :has_bill
      t.boolean :saved_money
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
