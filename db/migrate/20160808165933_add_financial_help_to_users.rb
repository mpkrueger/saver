class AddFinancialHelpToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :financial_help, :string
  end
end
