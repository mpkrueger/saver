class AddChatTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :chat_type, :string
  end
end
