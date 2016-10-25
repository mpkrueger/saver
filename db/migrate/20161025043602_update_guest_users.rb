class UpdateGuestUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :guest_users, :student_amount, :decimal
  	remove_column :guest_users, :cc_amount, :decimal
  	remove_column :guest_users, :savings_amount, :decimal
  	remove_column :guest_users, :investments_type, :hstore
  	remove_column :guest_users, :future_day, :hstore
  	remove_column :guest_users, :preparedness, :string
  	remove_column :guest_users, :savvy_feel, :string
  	remove_column :guest_users, :student_attitude, :string
  	remove_column :guest_users, :cc_attitude, :string
  	remove_column :guest_users, :spend_less, :string
  	remove_column :guest_users, :savings_from_income, :string
  	remove_column :guest_users, :current_focus, :string

  	add_column :guest_users, :explain_stocks_vs_funds, :string
  	add_column :guest_users, :worry_about_risks, :string
  	add_column :guest_users, :curious_about_access_to_money, :string
  	add_column :guest_users, :remaining_concerns_about_access, :string
  	add_column :guest_users, :investment_goal, :string
  	add_column :guest_users, :post_investment_goal, :string
  	add_column :guest_users, :knows_amount_to_invest, :string
  	add_column :guest_users, :amount_wants_to_invest, :integer
  	add_column :guest_users, :amount_to_get_started, :integer
  	add_column :guest_users, :has_retirement_account, :string
  	add_column :guest_users, :has_invested_before, :string
  	add_column :guest_users, :explain_diversification, :string
  	add_column :guest_users, :has_these_types_of_debt, :hstore
  	add_column :guest_users, :questions, :text
  	add_column :guest_users, :follow_up_prefs, :string
  	add_column :guest_users, :concerns_about_risks, :text
  end
end
