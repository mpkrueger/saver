class AddReferredByToCustomers < ActiveRecord::Migration[5.0]
  def change
  	add_column :customers, :referred_by, :string
  end
end
