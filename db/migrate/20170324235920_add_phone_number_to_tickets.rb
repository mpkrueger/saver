class AddPhoneNumberToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :phone_number, :string
  end
end
