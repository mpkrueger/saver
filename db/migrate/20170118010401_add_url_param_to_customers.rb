class AddUrlParamToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :invite_url_param, :string, unique: true
  end
end
