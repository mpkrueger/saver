class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :nps
      t.integer :trust
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
    add_index :feedbacks, :user_id
  end
end
