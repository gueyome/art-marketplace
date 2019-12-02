class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details do |t|
      t.integer :quantity
      t.belongs_to :cart, index: true
      t.belongs_to :artwork, index: true
      t.timestamps
    end
  end
end
