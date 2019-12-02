class AddIndexArtworkAndIndexOrderToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_details, :order, foreign_key: true
    add_reference :order_details, :artwork, foreign_key: true
  end
end
