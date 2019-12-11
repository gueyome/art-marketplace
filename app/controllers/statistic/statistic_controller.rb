class Statistic::StatisticController < ApplicationController
  def index
    @artworks = Artwork.all
    @cart_details = CartDetail.all
    @carts = Cart.all
    @categories = Category.all
    @contacts = Contact.all
    @order_details = OrderDetail.all
    @orders = Order.all
    @private_messages = PrivateMessage.all
    @testimonials = Testimonial.all
    @users = User.all
  end
end
