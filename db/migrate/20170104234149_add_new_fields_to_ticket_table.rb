class AddNewFieldsToTicketTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :gave_consent, :boolean
    add_column :tickets, :future_followup, :date
  end
end
