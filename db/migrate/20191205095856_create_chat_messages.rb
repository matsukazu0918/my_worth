class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|

      t.timestamps
      t.integer :user_id
      t.integer :chat_room_id
      t.text :message
    end
  end
end
