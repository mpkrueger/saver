class AddCcFeelingToFinProfile < ActiveRecord::Migration[5.0]
  def change
  	add_column :fin_profiles, :cc_feeling, :string
  	add_column :fin_profiles, :cc_approach, :string
  	add_column :fin_profiles, :cc_rate, :decimal
  	add_column :fin_profiles, :student_feeling, :string
  	add_column :fin_profiles, :student_approach, :string
  	add_column :fin_profiles, :student_rate, :decimal
  end
end
