class AddIndexCartAndArtworkToCartDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_details, :cart, foreign_key: true
    add_reference :cart_details, :artwork, foreign_key: true
  end
end
