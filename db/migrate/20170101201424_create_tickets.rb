class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :type
      t.boolean :has_bill, default: false
      t.boolean :has_phone, default: false
      t.boolean :call_complete, default: false
      t.boolean :summary_email_sent, default: false
      t.boolean :successfully_saved_money, default: false
      t.string :amount_saved
      t.boolean :owes_money, default: false
      t.boolean :has_paid, default: false
      t.boolean :has_referred, default: false
      t.string :status
      t.references :saver_guest, foreign_key: true

      t.timestamps
    end
  end
end
