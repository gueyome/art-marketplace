class ApplicationController < ActionController::Base
  def create_cart_for_current_user
    if user_signed_in?
      if current_user.cart == nil
        @cart = Cart.create(user: current_user)
      end
    end
  end
end
