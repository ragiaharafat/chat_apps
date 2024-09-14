class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.belongs_to :app, null: false, foreign_key: true
      t.integer :chat_id
      t.integer :messages_count

      t.timestamps
    end
    add_index :chats, [:chat_id, :app_id], unique: true
  end
end
