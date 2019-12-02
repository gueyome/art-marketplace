class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :artwork_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
