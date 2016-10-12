class ChangeHasTheseTypesOfDebtToHash < ActiveRecord::Migration[5.0]
  def change
  	remove_column :investing_profiles, :has_these_types_of_debt, :string
  	add_column :investing_profiles, :has_these_types_of_debt, :hstore

  end
end
