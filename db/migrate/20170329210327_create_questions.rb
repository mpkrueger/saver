class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :message
      t.string :email_contact
      t.references :visit, foreign_key: true

      t.timestamps
    end
  end
end
