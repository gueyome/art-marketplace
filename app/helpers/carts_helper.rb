module CartsHelper
  def sum_cart?
    @cart = current_user.cart
    sum = 0
    @cart.cart_details.each do |cart_detail|
      quantity_of_artworks = cart_detail.quantity
      artwork_price = cart_detail.artwork.price
      sum+= artwork_price * quantity_of_artworks
    end
    return sum.round(2)
  end

  def sum_line(cart_detail)
    sum = 0
    quantity_of_artworks = cart_detail.quantity
    artwork_price = cart_detail.artwork.price
    sum = artwork_price * quantity_of_artworks
    return sum.round(2)
  end

end
