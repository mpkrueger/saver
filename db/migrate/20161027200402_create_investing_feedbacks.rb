class CreateInvestingFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :investing_feedbacks do |t|
      t.string :investment_service
      t.string :invested_amount
      t.text :investing_experience
      t.text :investing_better
      t.text :got_stuck
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
