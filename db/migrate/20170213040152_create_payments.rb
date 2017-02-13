class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :stripe_charge_id
      t.references :customer, foreign_key: true
      t.references :payment_method, foreign_key: true

      t.timestamps
    end
  end
end
