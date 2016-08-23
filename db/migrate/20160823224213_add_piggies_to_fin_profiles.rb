class AddPiggiesToFinProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :fin_profiles, :piggies, :integer, default: 0
  end
end
