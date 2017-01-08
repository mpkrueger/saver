class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.string :stripe_customer_id
      t.references :saver_guest, foreign_key: true

      t.timestamps
    end
  end
end
