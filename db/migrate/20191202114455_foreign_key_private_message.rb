class ForeignKeyPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_index :private_messages, :sender_id
    add_index :private_messages, :receiver_id
  end
end
