class ChangeMessagesToChats < ActiveRecord::Migration[6.1]
  def change
    rename_table :messages, :chats
  end
end
