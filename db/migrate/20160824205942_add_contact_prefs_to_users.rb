class AddContactPrefsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :contact_prefs, :string
  end
end
