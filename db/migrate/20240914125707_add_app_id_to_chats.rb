class AddAppIdToChats < ActiveRecord::Migration[7.2]
  def change
    add_column :chats, :app_id, :integer
  end
end
