module Statistic::StatisticHelper
  def average_price(model)
    @total = 0
    model.each do |item|
      @total += item.price
    end
    @verdict = @total/model.size
    return @verdict.round(2)
  end

  def total(model)
    @total = 0
    model.each do |item|
      @total += item.price
    end
    return @total.round(2)
  end

  def average_number_testimonials_per_user
    @testimonials = Testimonial.all
    @users = User.all
    @verdict = @testimonials.size.to_f/@users.size.to_f
    return @verdict.round(2)
  end

  def average_number_pm_per_user
    @private_messages = PrivateMessage.all
    @users = User.all
    @verdict = @private_messages.size.to_f/@users.size.to_f
    return @verdict.round(2)
  end

  def average_number_order_per_user
    @orders = Order.all
    @users = User.all
    @verdict = @orders.size.to_f/@users.size.to_f
    return @verdict.round(2)
  end

  def average_number_artworks_per_order
    @orders = Order.all
    @total_artworks = 0
    @orders.each do |order|
      @total_artworks += order.artworks.size
    end
    @verdict = @total_artworks.to_f/@orders.size.to_f
    return @verdict.round(2)
  end

  def amount_of_all_orders
    @orders = Order.all
    @total_price = 0
    @orders.each do |order|
      order.order_details.each do |order_detail|
        @total_price += order_detail.artwork.price.to_f * order_detail.quantity.to_f
      end
    end
    return @total_price.round(2)
  end

  def average_number_artworks_per_cart
    @carts = Cart.all
    @total_artworks = 0
    @carts.each do |cart|
      @total_artworks += cart.artworks.size
    end
    @verdict = @total_artworks.to_f/@carts.size.to_f
    return @verdict.round(2)
  end

  def amount_of_all_carts
    @carts = Cart.all
    @total_price = 0
    @carts.each do |cart|
      cart.cart_details.each do |cart_detail|
        @total_price += cart_detail.artwork.price.to_f * cart_detail.quantity.to_f
      end
    end
    return @total_price.round(2)
  end

  def true_admin
    if current_user
    unless current_user.is_admin == true 
      flash[:error] = "You're not the real admin King"
      redirect_to root_path
    end
    else
      flash[:danger] = "Not connected little Boy"
      redirect_to root_path
    end
  end

end
