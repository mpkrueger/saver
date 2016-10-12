class AddQuestionsToInvestingProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :investing_profiles, :questions, :text
    add_column :investing_profiles, :follow_up_prefs, :string
  end
end
