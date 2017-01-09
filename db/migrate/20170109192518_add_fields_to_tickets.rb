class AddFieldsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :service_provider, :string
    add_column :tickets, :zip_code, :integer
    add_column :tickets, :old_monthly_rate, :integer
    add_column :tickets, :tv_service, :string
    add_column :tickets, :internet_service, :string
    add_column :tickets, :phone_service, :string
  end
end
