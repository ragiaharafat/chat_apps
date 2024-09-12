class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.references :application, null: false, foreign_key: true
      t.integer :message_id
      t.integer :messages_count

      t.timestamps
    end
    add_index :chats,[:application_id,:chat_id], unique = true
  end
end
