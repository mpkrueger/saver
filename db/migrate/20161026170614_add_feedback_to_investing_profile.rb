class AddFeedbackToInvestingProfile < ActiveRecord::Migration[5.0]
  def change
  	add_column :investing_profiles, :investment_service, :string
  	add_column :investing_profiles, :invested_amount, :string
  	add_column :investing_profiles, :investing_experience, :text
  	add_column :investing_profiles, :investing_better, :text
  end
end
