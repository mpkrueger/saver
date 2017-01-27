class AddSignupPageToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :signup_page, :string
  end
end
