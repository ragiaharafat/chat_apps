class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.integer :message_id
      t.text :body

      t.timestamps
    end
    add_index :chats,[:chat_id,:message_id], unique = true
  end
end
