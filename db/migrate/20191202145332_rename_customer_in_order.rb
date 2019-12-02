class RenameCustomerInOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :customer_id, :user_id
  end
end
