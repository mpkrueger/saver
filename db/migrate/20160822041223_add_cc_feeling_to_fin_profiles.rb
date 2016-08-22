class AddCcFeelingToFinProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :fin_profiles, :cc_feeling, :string
  end
end
