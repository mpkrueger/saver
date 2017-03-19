class RemoveUidAndProviderFromCustomers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :customers, :uid, :string
  	remove_column :customers, :provider, :string
  end
end
