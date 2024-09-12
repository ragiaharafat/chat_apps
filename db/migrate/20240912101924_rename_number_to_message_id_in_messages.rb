class RenameNumberToMessageIdInMessages < ActiveRecord::Migration[7.2]
  def change
    rename_column :messages, :number, :message_id
  end
end
