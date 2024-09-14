class RemoveApplicationIdFromChats < ActiveRecord::Migration[7.2]
  def change
    remove_index :chats, name: 'index_chats_on_number_and_application_id' if index_exists?(:chats, [:number, :application_id])
    remove_index :chats, :application_id if index_exists?(:chats, :application_id)
    
    # # Remove the column
    # remove_column :chats, :application_id
  end
end
