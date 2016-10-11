class CreateInvestingProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :investing_profiles do |t|
      t.boolean :explain_stocks_vs_funds
      t.boolean :knows_diversification
      t.boolean :worry_about_risks
      t.boolean :curious_about_access_to_money
      t.boolean :remaining_concerns_about_access
      t.string :investment_goal
      t.string :post_investment_goal
      t.boolean :knows_amount_to_invest
      t.decimal :amount_wants_to_invest
      t.decimal :amount_to_get_started
      t.boolean :has_retirement_account
      t.boolean :has_invested_before
      t.string :has_these_types_of_debt, array: true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
