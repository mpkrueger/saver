class AddPreviousInvestmentServiceToGuestUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :guest_users, :previous_investment_service, :string
  	add_column :investing_profiles, :previous_investment_service, :string
  end
end
