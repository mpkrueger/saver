class AddConcernsAboutRisks < ActiveRecord::Migration[5.0]
  def change
  	add_column :investing_profiles, :concerns_about_risks, :text
  end
end
